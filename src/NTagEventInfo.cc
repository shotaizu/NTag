#include <math.h>
#include <cassert>
#include <iostream>
#include <numeric>

#include <TMath.h>

// Size limit of secondary tree/bank
#define MAXNSCNDPRT (4000)

#include <skroot.h>
#undef MAXHWSK
#include <apmringC.h>
#include <apmueC.h>
#include <appatspC.h>
#include <geotnkC.h>
#include <skheadC.h>
#include <sktqC.h>
#include <geopmtC.h>
#include <skvectC.h>
#include <neworkC.h>
#include <apscndryC.h>
#include <loweroot.h>

#include "NTagPath.hh"
#include "NTagEventInfo.hh"
#include "SKLibs.hh"

NTagEventInfo::NTagEventInfo(Verbosity verbose)
:PMTXYZ(geopmt_.xyzpm), C_WATER(21.5833),
N10TH(7), N10MX(50), N200MX(140), VTXSRCRANGE(4000.),
T0TH(2.), T0MX(600.), TMATCHWINDOW(40.), TMINPEAKSEP(50.), ODHITMX(16.),
customvx(0.), customvy(0.), customvz(0.),
fVerbosity(verbose), bData(false), useTMVA(true), saveTQ(false)
{
    msg = NTagMessage("", fVerbosity);

    SetN10Limits(7, 50);
    SetN200Max(140);
    SetT0Limits(5., 600.);   // [us]
    SetDistanceCut(4000.);   // [cm]
    SetTMatchWindow(40.);    // [ns]
    SetTPeakSeparation(50.); // [us]
    SetMaxODHitThreshold(16);

    TMVATools = NTagTMVA(verbose);
    TMVATools.SetReader("MLP", (GetENV("NTAGPATH")+"weights/MLP_Gd0.02p.xml").c_str());
    TMVATools.SetReaderCutRange("N10", N10TH, N10MX);
    TMVATools.SetReaderCutRange("ReconCT", T0TH*1.e3, T0MX*1.e3);
    TMVATools.DumpReaderCutRange();
}

NTagEventInfo::~NTagEventInfo() {}

void NTagEventInfo::SetEventHeader()
{
    runNo = skhead_.nrunsk;
    subrunNo = skhead_.nsubsk;
    eventNo  = skhead_.nevsk;
    
    // Mimic QISMSK: sum all Q of ID hits within 1.3 usec gate
    qismsk = 0.;
    for (int iHit = 0; iHit < sktqz_.nqiskz; iHit++) {
        float hitTime = sktqz_.tiskz[iHit];
        if (479.2 < hitTime && hitTime < 1779.2) {
            qismsk += sktqz_.qiskz[iHit];
        }
    }
    
    msg.Print(Form("qismsk: %f", qismsk), pDEBUG);
    
    // Number of OD hits
    odpc_2nd_s_(&nhitac);
    msg.Print(Form("Number of OD hits: %d", nhitac), pDEBUG);
    
    // Read trigger offset
    trginfo_(&trgOffset);
    msg.Print(Form("Trigger offset: %f", trgOffset), pDEBUG);
}

void NTagEventInfo::SetPromptVertex()
{
    switch (fVertexMode) {
        case mAPFIT: {
            // Get apcommul bank
            int bank = 0;
            aprstbnk_(&bank);
            pvx = apcommul_.appos[0];
            pvy = apcommul_.appos[1];
            pvz = apcommul_.appos[2]; break; }
        case mBONSAI: {
            int lun = 10;
            TreeManager* mgr  = skroot_get_mgr(&lun);
            LoweInfo*    LOWE = mgr->GetLOWE();
            mgr->GetEntry();
            pvx = LOWE->bsvertex[0];
            pvy = LOWE->bsvertex[1];
            pvz = LOWE->bsvertex[2]; break; }
        case mCUSTOM: {
            pvx = customvx;
            pvy = customvy;
            pvz = customvz; break; }
        case mTRUE: {
            skgetv_();
            pvx = skvect_.pos[0];
            pvy = skvect_.pos[1];
            pvz = skvect_.pos[2]; break; }
        case mSTMU: {
            /* STMU */ break; }
    }
    
    float tmp_v[3] = {pvx, pvy, pvz};
    dWall = wallsk_(tmp_v);
    
    msg.Print(Form("Prompt vertex: %f, %f, %f", pvx, pvy, pvz), pDEBUG);
    msg.Print(Form("d_wall: %f", dWall), pDEBUG);
}

void NTagEventInfo::SetAPFitInfo()
{
    // E_vis
    evis = apcomene_.apevis;
    msg.Print(Form("e_vis: %f", evis), pDEBUG);

    // AP ring information
    apNRings = apcommul_.apnring;
    for (int iRing = 0; iRing < apNRings; iRing++) {
        vAPRingPID.push_back( apcommul_.apip[iRing]         );  // PID
        vAPMom.push_back    ( apcommul_.apamom[iRing]       );  // Reconstructed momentum
        vAPMomE.push_back   ( appatsp2_.apmsamom[iRing][1]  );  // e-like momentum
        vAPMomMu.push_back  ( appatsp2_.apmsamom[iRing][2]  );  // mu-like momentum
    }
    msg.Print(Form("APFit number of rings: %d", apNRings), pDEBUG);

    // mu-e check
    apNMuE = apmue_.apnmue; apNDecays = 0;
    for (int iMuE = 0; iMuE < apNMuE; iMuE++) {
        if (iMuE == 10) break;
        if (apmue_.apmuetype[iMuE] == 1 || apmue_.apmuetype[iMuE] == 4) apNDecays++;
    }
}

void NTagEventInfo::SetLowFitInfo()
{
    int lun = 10;

    TreeManager* mgr  = skroot_get_mgr(&lun);
    LoweInfo*    LOWE = mgr->GetLOWE();
    mgr->GetEntry();

    // E_vis
    evis = LOWE->bsenergy;
    msg.Print(Form("e_vis: %f", evis), pDEBUG);
}

void NTagEventInfo::AppendRawHitInfo()
{
    float tOffset = 0.;
    float tLast   = 0.;
    float qLast   = 0.;
    int   pmtLast = 0.;

    bool  coincidenceFound = true;

    if (!vTISKZ.empty()) {
        coincidenceFound = false;
        tLast   = vTISKZ.back();
        qLast   = vQISKZ.back();
        pmtLast = vCABIZ.back();
    }

    for (int iHit = 0; iHit < sktqz_.nqiskz; iHit++) {

        if (!coincidenceFound && sktqz_.qiskz[iHit] == qLast && sktqz_.icabiz[iHit] == pmtLast) {
            tOffset = tLast - sktqz_.tiskz[iHit];
            coincidenceFound = true;
            msg.Print(Form("Coincidence found: t = %f ns, (offset: %f ns)", tLast, tOffset), pDEBUG);
        }

        if (sktqz_.ihtiflz[iHit] & (1<<1)) {
            vTISKZ.push_back( sktqz_.tiskz[iHit] + tOffset );
            vQISKZ.push_back( sktqz_.qiskz[iHit]           );
            vCABIZ.push_back( sktqz_.icabiz[iHit]          );
        }
    }

    nqiskz = static_cast<int>(vTISKZ.size());
    msg.Print(Form("nqiskz after append: %d", nqiskz), pDEBUG);
}

void NTagEventInfo::SetToFSubtractedTQ()
{
    // Subtract ToF from raw PMT hit time
    float fitVertex[3] = {pvx, pvy, pvz};
    //float fitVertex[3] = {vCapVX[0], vCapVY[0], vCapVZ[0]};
    vUnsortedT_ToF = GetToFSubtracted(vTISKZ, vCABIZ, fitVertex, false);

    SortToFSubtractedTQ();
}

void NTagEventInfo::SetMCInfo()
{
    // Read SKVECT (primaries)
    skgetv_();
    nVec  = skvect_.nvect;   // number of primaries
    vecx = skvect_.pos[0];   // initial vertex of primaries
    vecy = skvect_.pos[1];
    vecz = skvect_.pos[2];

    msg.Print(Form("True Vector: %d", nVec), pDEBUG);

    for (int iVec = 0; iVec < nVec; iVec++) {
        vVecPID.push_back  ( skvect_.ip[iVec]     );  // PID of primaries
        vVecPX.push_back   ( skvect_.pin[iVec][0] );  // momentum vector of primaries
        vVecPY.push_back   ( skvect_.pin[iVec][1] );
        vVecPZ.push_back   ( skvect_.pin[iVec][2] );
        vVecMom.push_back  ( skvect_.pabs[iVec]   );  // momentum of primaries
        
        if (vVecPID[iVec] == 13) // Neutron code in Geant3 is 13
        msg.Print(Form("Primary neutron %d: [p = %f MeV/c] [dwall: %f cm]", 
                            iVec, vVecMom[iVec], dWall), pDEBUG);
    }

    // Read neutrino interaction vector
    float posnu[3];
    nerdnebk_(posnu);

    neutIntMode = nework_.modene;       // neutrino interaction mode
    nVecInNeut  = nework_.numne;        // number of particles in vector
    nNInNeutVec     = 0;                    // number of neutrons
    neutIntMom    = Norm(nework_.pne[0]);

    for (int i = 0; i < nVecInNeut; i++) {
        vNeutVecPID.push_back(nework_.ipne[i]);     // PIDs in vector
        if (vNeutVecPID[i] == 2112 && i >= 3) nNInNeutVec++; // count neutrons
    }
    msg.Print(Form("Number of neutrons in NEUT primary stack: %d", nNInNeutVec), pDEBUG);

    // Initialize number of n captures
    nTrueCaptures = 0;
    nSavedSec = 0;

    // ?
    float ZBLST = 5.30;
    float dr    = RINTK - ZBLST;
    float dz    = 0.5 * HIINTK - ZBLST;

    // Read secondary bank
    ReadSecondaries();

    int nSecNeutron = 0;
    nAllSec = secndprt_.nscndprt;

    // Loop over all secondaries in secondary common block
    for (int iSec = 0; iSec < nAllSec; iSec++) {

        float secMom = Norm(secndprt_.pscnd[iSec]);
        
        // Save all neutrons
        if (secndprt_.iprtscnd[iSec] == 2112) {
            SaveSecondary(iSec);
            nSecNeutron++;
            msg.Print(Form("Secondary neutron (#%d): [t = %f ns] [p = %f MeV/c]",
                         nSecNeutron, secndprt_.tscnd[iSec]*1e-3, Norm(secndprt_.pscnd[iSec])), pDEBUG);
        }
        
        // deuteron, gamma, electrons
        else if (secndprt_.iprtscnd[iSec] == 100045 || 
                 secndprt_.iprtscnd[iSec] == 22 ||
                 // electrons over Cherenkov threshold momentum
                 (fabs(secndprt_.iprtscnd[iSec]) == 11 && secMom > 0.579)) {

            /* Save capture info from below */
            float vtxR2 = secndprt_.vtxscnd[iSec][0] * secndprt_.vtxscnd[iSec][0]
                        + secndprt_.vtxscnd[iSec][1] * secndprt_.vtxscnd[iSec][1];
            int inPMT;
            inpmt_(secndprt_.vtxscnd[iSec], inPMT);
            
            // Check if the capture is within ID volume
            if (vtxR2 < dr*dr && fabs(secndprt_.vtxscnd[iSec][2]) < dz && !inPMT) {

                // Save secondary (deuteron, gamma, electrons)
                SaveSecondary(iSec);
                bool isNewCapture = true;

                // particle produced by n-capture
                if (secndprt_.lmecscnd[iSec] == 18) {

                    // Check saved capture stack
                    for (int iCheckedCT = 0; iCheckedCT < nTrueCaptures; iCheckedCT++) {
                        // If this capture is already saved:
                        if (fabs((double)(secndprt_.tscnd[iSec] - vTrueCT[iCheckedCT])) < 1.e-7) {
                            isNewCapture = false;
                            // Add capture product gammas to the pre-existing stack
                            if (secndprt_.iprtscnd[iSec] == 22) {
                                //msg.Print(Form("Gamma from already saved capture... captureID %d", iCheckedCT), pDEBUG);
                                vNGamma[iCheckedCT]++;
                                vTotGammaE[iCheckedCT] +=  Norm( secndprt_.pscnd[iSec] );
                                vCapID[nSavedSec-1] = iCheckedCT;
                            }
                        }
                    }
                    if (isNewCapture) {
                        vTrueCT.push_back( secndprt_.tscnd[iSec]      );
                        vCapVX.push_back    ( secndprt_.vtxscnd[iSec][0] );
                        vCapVY.push_back    ( secndprt_.vtxscnd[iSec][1] );
                        vCapVZ.push_back    ( secndprt_.vtxscnd[iSec][2] );
                        // Add capture product gamma
                        if (secndprt_.iprtscnd[iSec] == 22) {
                            //msg.Print(Form("Gamma from new capture... vCaptureID %d", nTrueCaptures), pDEBUG);
                            vNGamma.push_back(1);
                            vTotGammaE.push_back( Norm( secndprt_.pscnd[iSec] ) );
                            vCapID[nSavedSec-1] = nTrueCaptures;
                        }
                        else { vNGamma.push_back(0); vTotGammaE.push_back(0.); }
                        // increment total number of captures
                        nTrueCaptures++;
                    }
                }
            }
        }
    }
    assert(nSavedSec == static_cast<int>(vSecPID.size()));
    assert(nSavedSec == static_cast<int>(vCapID.size()));

    for (int iCapture = 0; iCapture < nTrueCaptures; iCapture++) {
        msg.Print(Form("CaptureID %d: [t: %f us] [Gamma E: %f MeV] [x: %f y: %f z: %f]",
                        iCapture, vTrueCT[iCapture]*1e-3, vTotGammaE[iCapture],
                        vCapVX[iCapture], vCapVY[iCapture], vCapVZ[iCapture]), pDEBUG);
        msg.Print(Form("Neutron travel distance from prompt vertex: %f cm", 
                        Norm(pvx-vCapVX[iCapture], pvy-vCapVY[iCapture], pvz-vCapVZ[iCapture])), pDEBUG);
    }
    msg.Print(Form("Number of secondary neutrons saved in bank: %d", nSecNeutron), pDEBUG);
    msg.Print(Form("Number of captures: %d", nTrueCaptures), pDEBUG);
}

void NTagEventInfo::ReadSecondaries()
{
    apflscndprt_();
}

void NTagEventInfo::SearchCaptureCandidates()
{
    int   iHitPrevious    = 0;
    int   N10New          = 0;
    int   N10Previous     = 0;
    int   N200Previous    = 0;
    float t0Previous      = -1.;

    // Loop over the saved TQ hit array from current event
    for (int iHit = 0; iHit < nqiskz; iHit++) {

        // the Hit timing w/o TOF is larger than limit, or less smaller than t0
        if (vSortedT_ToF[iHit]*1.e-3 < T0TH) continue;

        // Save time of first hit
        if (firstHitTime_ToF == 0.) firstHitTime_ToF = vSortedT_ToF[iHit];

        // Calculate N10New:
        // number of hits in 10 ns window from the i-th hit
        int N10i = GetNhitsFromStartIndex(vSortedT_ToF, iHit, 10.);

        // If N10TH <= N10i <= N10MX:
        if ((N10i < N10TH) || (N10i >= N10MX+1)) continue;

        // We've found a new peak.
        N10New = N10i;
        float t0New = vSortedT_ToF[iHit];

        // Save maximum N200 and its t0
        float N200New = GetNhitsFromCenterTime(vSortedT_ToF, t0New + 5., 200.);
        if (t0New > 2.e4 && N200New > maxN200) {
            maxN200 = N200New;
            maxN200Time = t0New;
        }

        // If peak t0 diff = t0New - t0Previous > TMINPEAKSEP, save the previous peak.
        // Also check if N200Previous is below N200 cut and if t0Previous is over t0 threshold
        if (t0New - t0Previous > TMINPEAKSEP) {
            if (N200Previous < N200MX && t0Previous*1.e-3 > T0TH) {
                if (t0Previous < 2000) msg.Print(Form("!!! T0: %f", t0Previous), pDEBUG);
                SavePeakFromHit(iHitPrevious);
            }
            // Reset N10Previous,
            // if peaks are separated enough
            N10Previous = 0;
        }

        // If N10 is not greater than previous, skip
        if ( N10New <= N10Previous ) continue;

        iHitPrevious = iHit;
        t0Previous   = t0New;
        N10Previous  = N10New;
        N200Previous = N200New;
    }
    // Save the last peak
    SavePeakFromHit(iHitPrevious);

    // Select hits within 50 ns around each capture candidate
    // to calculate beta and feed BONSAI

    int                 n50hits, n1300hits;
    std::vector<int>    index50, index1300, nindex;
    std::vector<int>    cabiz50, cabiz1300;
    std::vector<float>  tiskz50, qiskz50, tiskz1300, qiskz1300;

    msg.Print("Searching for new N10 via TRMS minimization...", pDEBUG);
    msg.Print(Form("Number of candidates : %d", nCandidates), pDEBUG);

    std::vector<float>* dt = TMVATools.fVariables.GetVector("ReconCT");

    // Loop over all found capture candidates
    for (int iCandidate = 0; iCandidate < nCandidates; iCandidate++) {
        index50.clear(); index1300.clear(); nindex.clear();
        cabiz50.clear(); cabiz1300.clear();
        tiskz50.clear(); qiskz50.clear(); tiskz1300.clear(); qiskz1300.clear();

        n50hits = 0;
        n1300hits = 0;

        // Loop over all hits in event
        for (int iHit = 0; iHit < nqiskz; iHit++) {

            // Count N50 and save hit indices in vSortedT_ToF
            //if (fabs(vUnsortedT_ToF[iHit] - vDt[iCandidate]) < 25.) {
            if (fabs(vUnsortedT_ToF[iHit] - dt->at(iCandidate)) < 25.) {
                  index50.push_back(iHit);
                  n50hits++;
            }

            // 1.3 us window to feed BONSAI
            // Count N1300 and save hit indices in vSortedT_ToF
            if (vUnsortedT_ToF[iHit] > dt->at(iCandidate) - 520.8
            &&  vUnsortedT_ToF[iHit] < dt->at(iCandidate) + 779.2) {
                if (n1300hits < 1000) {
                    index1300.push_back(iHit);
                    n1300hits++;
                }
            }
        }

        for (int iHit50 = 0; iHit50 < n50hits; iHit50++) {
            cabiz50.push_back( vCABIZ[ index50[iHit50] ] );
            tiskz50.push_back( vTISKZ[ index50[iHit50] ]  );
            qiskz50.push_back( vQISKZ[ index50[iHit50] ]  );
        }

        for (int iHit1300 = 0; iHit1300 < n1300hits; iHit1300++) {
            cabiz1300.push_back( vCABIZ[ index1300[iHit1300] ] );
            tiskz1300.push_back( vTISKZ[ index1300[iHit1300] ]  );
            qiskz1300.push_back( vQISKZ[ index1300[iHit1300] ]  );
        }

        // Calculate betas for N50 hits
        auto beta_50 = GetBetaArray(cabiz50, 0, n50hits);

        // Save N50, N1300, and betas for N50 hits
        vN1300.push_back( n1300hits );
        vBeta14_50.push_back( beta_50[1] + 4*beta_50[4] );

        TMVATools.fVariables.PushBack("N50",   n50hits);
        TMVATools.fVariables.PushBack("Beta1", beta_50[1]);
        TMVATools.fVariables.PushBack("Beta2", beta_50[2]);
        TMVATools.fVariables.PushBack("Beta3", beta_50[3]);
        TMVATools.fVariables.PushBack("Beta4", beta_50[4]);
        TMVATools.fVariables.PushBack("Beta5", beta_50[5]);

        // BONSAI fit to each capture candidate
        float tmptbsenergy, tmptbsvx, tmptbsvy, tmptbsvz, tmptbsvt, tmptbsgood, tmptbsdirks, tmptbspatlik, tmptbsovaq;
        float time0 = dt->at(iCandidate);

        // Maybe high or low hit noise.
        if (n1300hits > 999 || n1300hits < 50) {
            tmptbsenergy = 0.;
            tmptbsvx = 9999.;
            tmptbsvy = 9999.;
            tmptbsvz = 9999.;
            tmptbsvt = 0.;
            tmptbsgood = 0.;
            tmptbsdirks = 1.;
            tmptbspatlik = 0.;
            tmptbsovaq = -1.;
        }
        else {
            bonsai_fit_(&bData, &time0, tiskz1300.data(), qiskz1300.data(), cabiz1300.data(), &n1300hits, &tmptbsenergy,
                        &tmptbsvx, &tmptbsvy, &tmptbsvz, &tmptbsvt, &tmptbsgood, &tmptbsdirks, &tmptbspatlik, &tmptbsovaq);
        }

        // Fix tbspatlik->-inf bug
        if (tmptbspatlik < -9999.) tmptbspatlik = -9999.;

        float tbsvertex[3] = {tmptbsvx, tmptbsvy, tmptbsvz};

        vBSvx.push_back( tmptbsvx );
        vBSvy.push_back( tmptbsvy );
        vBSvz.push_back( tmptbsvz );
        vBSReconCT.push_back( tmptbsvt );

        TMVATools.fVariables.PushBack("BSenergy", tmptbsenergy);
        TMVATools.fVariables.PushBack("BSwall",   wallsk_(tbsvertex));
        TMVATools.fVariables.PushBack("BSgood",   tmptbsgood);
        TMVATools.fVariables.PushBack("BSdirks",  tmptbsdirks);
        TMVATools.fVariables.PushBack("BSpatlik", tmptbspatlik);
        TMVATools.fVariables.PushBack("BSovaq",   tmptbsovaq);

        float nv[3];	// vertex to fit by minimizing tRMS
        float minTRMS50 = MinimizeTRMS(tiskz50, cabiz50, nv);
        
        vNvx.push_back   ( nv[0]       );
        vNvy.push_back   ( nv[1]       );
        vNvz.push_back   ( nv[2]       );

        TMVATools.fVariables.PushBack("DWalln", wallsk_(nv));
        TMVATools.fVariables.PushBack("TRMS50", minTRMS50);

        auto tiskz50_ToF = GetToFSubtracted(tiskz50, cabiz50, nv, true);

        int N10in, tmpN10n = 0;
        float t0n = 0.;

        // Search for a new best N10 (N10n) from these new ToF corrected hits
        int n10index = 0;
        for (int iHit50 = 0; iHit50 < n50hits; iHit50++) {
            N10in = GetNhitsFromStartIndex(tiskz50_ToF, iHit50, 10.);
            if (N10in > tmpN10n) {
                tmpN10n = N10in; n10index = iHit50;
                t0n = (tiskz50_ToF[iHit50] + tiskz50_ToF[iHit50+tmpN10n-1]) / 2.;
            }
        }

        vTRMS10n.push_back( GetTRMSFromStartIndex(tiskz50_ToF, n10index, 10.) );
        vN10n.push_back( tmpN10n );
        vReconCTn.push_back(  t0n );

        float promptBonsai 	= Norm(pvx - vBSvx[iCandidate],
                               pvy - vBSvy[iCandidate],
                               pvz - vBSvz[iCandidate]);
        float promptNfit 	= Norm(pvx - vNvx[iCandidate],
                               pvy - vNvy[iCandidate],
                               pvz - vNvz[iCandidate]);
        float bonsaiNfit    = Norm(vNvx[iCandidate] - vBSvx[iCandidate],
                               vNvy[iCandidate] - vBSvy[iCandidate],
                               vNvz[iCandidate] - vBSvz[iCandidate]);

        TMVATools.fVariables.PushBack("prompt_bonsai", promptBonsai);
        TMVATools.fVariables.PushBack("prompt_nfit", promptNfit);
        TMVATools.fVariables.PushBack("bonsai_nfit", bonsaiNfit);
        
        msg.Print(Form("Neut-fit capture vertex: [x: %f y: %f z: %f]", 
                        vNvx[iCandidate], vNvy[iCandidate], vNvz[iCandidate]), pDEBUG);
        msg.Print(Form("prompt_nfit: %f cm", promptNfit), pDEBUG);
    }

    if (!bData) {
        msg.Print("Setting true capture info...", pDEBUG);
        SetTrueCaptureInfo();
    }
}

void NTagEventInfo::SetTrueCaptureInfo()
{
    std::vector<float> checkedCT;
    int nCheckedCaptures = 0;

    for (int iCandidate = 0; iCandidate < nCandidates; iCandidate++) {

        // Check if a candidate is a true neutron capture (MC only)
        vIsCapture.push_back( IsCapture(iCandidate, true) );

        // if a candidate is actually a true neutron capture
        if (vIsCapture[iCandidate] == 1) {

            vDoubleCount.push_back(0);
            // time diff between true and reconstructed capture time
            vCTDiff.push_back( ReconCaptureTime(iCandidate) - TrueCaptureTime(iCandidate) );

            bool newCaptureFound = true;

            if (!checkedCT.empty()) {
                for (const auto& CTinList: checkedCT) {
                    if (fabs(TrueCaptureTime(iCandidate) - CTinList) < 1.e-3) {
                        newCaptureFound = false; break;
                    }
                }
            }

            if (newCaptureFound) {
                checkedCT.push_back( TrueCaptureTime(iCandidate) );
            }

            // Check whether two adjacent candidates should be saved as a single true capture
            else {
                if (fabs(vCTDiff[iCandidate]) < fabs(vCTDiff[iCandidate-1])) {
                    vDoubleCount[iCandidate-1] = 1; vIsCapture[iCandidate-1] = 0;
                }
                else {
                    vDoubleCount[iCandidate] = 1; vIsCapture[iCandidate] = 0;
                }
            }

            auto tmpTruthV = TrueCaptureVertex(iCandidate);
            vTrueCapVX.push_back( tmpTruthV[0] );
            vTrueCapVY.push_back( tmpTruthV[1] );
            vTrueCapVZ.push_back( tmpTruthV[2] );

            // Check whether capture is on Gd or H
            vIsGdCapture.push_back( IsGdCapture(iCandidate) );
            
            msg.Print(Form("Candidate %d: Distance from capture vertex to Neut-fit vertex: %f cm",
                            iCandidate,
                            Norm(vTrueCapVX[iCandidate] - vNvx[iCandidate], 
                                 vTrueCapVY[iCandidate] - vNvy[iCandidate], 
                                 vTrueCapVZ[iCandidate] - vNvz[iCandidate])), pDEBUG);
        }
        else {
            vDoubleCount.push_back(0);
            vCTDiff.push_back(0);
            vTrueCapVX.push_back(0);
            vTrueCapVY.push_back(0);
            vTrueCapVZ.push_back(0);
            vIsGdCapture.push_back(0);
        }
    }
}


void NTagEventInfo::GetTMVAOutput()
{
    if (useTMVA) {
        std::vector<float>* dt = TMVATools.fVariables.GetVector("ReconCT");
        
        for (int iCandidate = 0; iCandidate < nCandidates; iCandidate++) {
    
            float tmvaOutput = TMVATools.GetOutputFromCandidate(iCandidate);
    
            TString trueCaptureInfo;
            if (tmvaOutput == -9999.) trueCaptureInfo = "out-of-cut";
            if (!bData) {
                if (vIsCapture[iCandidate]) trueCaptureInfo = "true";
                else                            trueCaptureInfo = "false";
            }
            
            int  N10 = TMVATools.fVariables.Get<int>("N10", iCandidate);
            float dt = TMVATools.fVariables.Get<float>("ReconCT", iCandidate);
            msg.Print(Form("iCandidate: %d T0: %f [ns] N10: %d N10n: %d TMVAOutput: %f [%s]", 
                            iCandidate, dt, N10, vN10n[iCandidate], tmvaOutput, trueCaptureInfo.Data()), pDEBUG);
            vTMVAOutput.push_back( tmvaOutput );
        }
    }
}

float NTagEventInfo::Norm(const float vec[3])
{
    return sqrt(vec[0]*vec[0] + vec[1]*vec[1] + vec[2]*vec[2]);
}

float NTagEventInfo::Norm(float x, float y, float z)
{
    return sqrt(x*x + y*y + z*z);
}

float NTagEventInfo::GetDistance(const float vec1[3], const float vec2[3])
{
    float tmpVec[3];

    for (int i = 0; i < 3; i++)
        tmpVec[i] = vec1[i] - vec2[i];

    return Norm(tmpVec);
}

float NTagEventInfo::ReconCaptureTime(int candidateID)
{
    // trgOffset may change with skdetsim version (13p90)
    return TMVATools.fVariables.Get<float>("ReconCT", candidateID) - trgOffset;
}

float NTagEventInfo::TrueCaptureTime(int candidateID)
{
    float tRecon = ReconCaptureTime(candidateID);
    float tClosest = 1.e8;

    if (nAllSec >= MAXNSCNDPRT) return -1;
    for (int iCapture = 0; iCapture < nTrueCaptures; iCapture++) {
        if ( fabs(vTrueCT[iCapture] - tRecon) < TMATCHWINDOW) {
            return vTrueCT[iCapture];
        }
    }

    if (!IsCapture(candidateID))
        msg.Print("A false neutron signal is passsed to TrueCaptureVertex!", pWARNING);

    return -9999.;
}

std::array<float, 3> NTagEventInfo::TrueCaptureVertex(int candidateID)
{
    std::array<float, 3> trueCaptureVertex = {0., 0., 0.};
    float tRecon = ReconCaptureTime(candidateID);

    for (int iCapture = 0; iCapture < nTrueCaptures; iCapture++) {
        if (fabs(vTrueCT[iCapture] - tRecon) < TMATCHWINDOW) {
                trueCaptureVertex[0] = vCapVX[iCapture];
                trueCaptureVertex[1] = vCapVY[iCapture];
                trueCaptureVertex[2] = vCapVZ[iCapture];
                return trueCaptureVertex;
        }
    }
    if (!IsCapture(candidateID))
        msg.Print("A false neutron signal is passsed to TrueCaptureVertex!", pWARNING);

    return trueCaptureVertex;
}

std::vector<float> NTagEventInfo::GetToFSubtracted(const std::vector<float>& T, const std::vector<int>& PMTID, float vertex[3], bool doSort)
{
    std::vector<float> t_ToF;
    std::vector<float> doSortT_ToF;

    int nHits = static_cast<int>(T.size());
    assert(nHits == static_cast<int>(PMTID.size()));

    // Subtract TOF from PMT hit time
    for (int iHit = 0; iHit < nHits; iHit++) {
        int pmtID = PMTID[iHit] - 1;
        t_ToF.push_back( T[iHit] - GetToF(vertex, pmtID) );
    }

    if (doSort) {
        int sortedIndex[nHits];
        TMath::Sort(nHits, t_ToF.data(), sortedIndex, false);
        for (int iHit = 0; iHit < nHits; iHit++)
           doSortT_ToF.push_back( t_ToF[ sortedIndex[iHit] ] );
        return doSortT_ToF;
    }
    else return t_ToF;
}

float NTagEventInfo::MinimizeTRMS(const std::vector<float>& T, const std::vector<int>& PMTID, float rmsFitVertex[])
{
    float delta;
    bool doSort = true;
    int nHits = static_cast<int>(T.size());
    assert(nHits == static_cast<int>(PMTID.size()));

    (VTXSRCRANGE > 200) ? delta = 100 : delta = VTXSRCRANGE / 2.;
    std::vector<float>  t_ToF;
    std::vector<float>* minTPointer;

    int rMax, zMax;
    zMax = (int)(2*ZPINTK / (float)delta);
    rMax = (int)(2*RINTK / (float)delta);

    // main search position starts from tank center
    std::array<float, 3> vecR = {0., 0., 0.};
    std::array<float, 3> tmpVertex = {0., 0., 0.};      // temp vertex to save minimizing vertex
    std::array<float, 3> srcVertex;                     // loop search vertex

    float minTRMS = 9999.;
    float tRMS;

    while (delta > 0.5) {

        for (float x = 0; x < rMax; x++) {
            srcVertex[0] = delta * (x - rMax/2.) + vecR[0];
            for (float y = 0; y < rMax; y++) {
                srcVertex[1] = delta * (y - rMax/2.) + vecR[1];

                if (sqrt(srcVertex[0]*srcVertex[0] + srcVertex[1]*srcVertex[1]) > RINTK) continue;
                for (float z = 0; z < zMax; z++) {
                    srcVertex[2] = delta * (z - zMax/2.) + vecR[2];

                    if (srcVertex[2] > ZPINTK || srcVertex[2] < -ZPINTK) continue;
                    if (Norm(srcVertex[0] - vecR[0], srcVertex[1] - vecR[1], srcVertex[2] - vecR[2]) > VTXSRCRANGE) continue;

                    t_ToF = GetToFSubtracted(T, PMTID, srcVertex.data(), doSort);

                    tRMS = GetTRMS(t_ToF);

                    if (tRMS < minTRMS) {
                        minTRMS = tRMS;
                        tmpVertex = srcVertex;
                        minTPointer = &t_ToF;
                    }
                }
            }
        }
        vecR = tmpVertex;
        delta = delta / 2.;
    }

    int index[1000];
    TMath::Sort(nHits, minTPointer->data(), index, false);

    rmsFitVertex[0] = vecR[0];
    rmsFitVertex[1] = vecR[1];
    rmsFitVertex[2] = vecR[2];

    return minTRMS;
}

std::array<float, 6> NTagEventInfo::GetBetaArray(const std::vector<int>& PMTID, int startIndex, int nHits)
{
    std::array<float, 6> beta = {0., 0., 0., 0., 0., 0};
    if (nHits == 0) return beta;

    float uvx[nHits], uvy[nHits], uvz[nHits];	// direction vector from vertex to each hit PMT

    for (int iHit = 0; iHit < nHits; iHit++) {
        float distFromVertexToPMT;
        float vecFromVertexToPMT[3];
        vecFromVertexToPMT[0] = PMTXYZ[PMTID[startIndex+iHit]-1][0] - pvx;
        vecFromVertexToPMT[1] = PMTXYZ[PMTID[startIndex+iHit]-1][1] - pvy;
        vecFromVertexToPMT[2] = PMTXYZ[PMTID[startIndex+iHit]-1][2] - pvz;
        distFromVertexToPMT = Norm(vecFromVertexToPMT);
        uvx[iHit] = vecFromVertexToPMT[0] / distFromVertexToPMT;
        uvy[iHit] = vecFromVertexToPMT[1] / distFromVertexToPMT;
        uvz[iHit] = vecFromVertexToPMT[2] / distFromVertexToPMT;
    }

    for (int i = 0; i < nHits-1; i++) {
        for (int j = i+1; j < nHits; j++) {
            // cosine angle between two consecutive uv vectors
            float cosTheta = uvx[i]*uvx[j] + uvy[i]*uvy[j] + uvz[i]*uvz[j];
            for (int k = 1; k <= 5; k++)
                beta[k] += GetLegendreP(k, cosTheta);
        }
    }

    for (int k = 1; k <= 5; k++)
        beta[k] = 2.*beta[k] / float(nHits) / float(nHits-1);

    // Return calculated beta array
    return beta;
}

float NTagEventInfo::GetLegendreP(int i, float& x)
{
    float result = 0.;

    if (i < 0 || i > 5) {
        msg.Print(Form("Incompatible i (%d) is passed to GetLegendreP.", i), pERROR);
    }

    switch (i) {
        case 1:
            result = x; break;
        case 2:
            result = (3*x*x-1)/2.; break;
        case 3:
            result = (5*x*x*x-3*x)/2; break;
        case 4:
            result = (35*x*x*x*x-30*x*x+3)/8.; break;
        case 5:
            result = (63*x*x*x*x*x-70*x*x*x+15*x)/8.; break;
    }

    return result;
}

void NTagEventInfo::SortToFSubtractedTQ()
{
    int sortedIndex[nqiskz], pmtID;

    // Sort: early hit first
    TMath::Sort(nqiskz, vUnsortedT_ToF.data(), sortedIndex, false);

    // Save hit info, sorted in (T - ToF)
    for (int iHit = 0; iHit < nqiskz; iHit++) {
        vSortedPMTID.push_back( vCABIZ[ sortedIndex[iHit] ]         );
        vSortedT_ToF.push_back( vUnsortedT_ToF[ sortedIndex[iHit] ] );
        vSortedQ.push_back    ( vQISKZ[ sortedIndex[iHit] ]         );
    }
}

int NTagEventInfo::GetNhitsFromStartIndex(const std::vector<float>& T, int startIndex, float tWidth)
{
    int searchIndex = startIndex;
    int nHits       = T.size();

    while (1) {
        searchIndex++;
        if ((searchIndex > nHits-1) || (TMath::Abs((T[searchIndex] - T[startIndex])) > tWidth))
            break;
    }
    // Return number of hits within the time window
    return TMath::Abs(searchIndex - startIndex);
}

float NTagEventInfo::GetQSumFromStartIndex(const std::vector<float>& T, const std::vector<float>& Q, int startIndex, float tWidth)
{
    int nHits       = Q.size();
    int searchIndex = startIndex;
    float sumQ      = 0.;

    while (1) {
        sumQ += Q[searchIndex];
        searchIndex++;
        if ((searchIndex > nHits-1) || (TMath::Abs((T[searchIndex] - T[startIndex])) > tWidth))
            break;
    }
    // Return total hit charge within the time window
    return sumQ;
}

float NTagEventInfo::GetToF(float vertex[3], int pmtID)
{
    float vecFromVertexToPMT[3];

    for (int i = 0; i < 3; i++)
        vecFromVertexToPMT[i] = vertex[i] - PMTXYZ[pmtID][i];

    return GetDistance(PMTXYZ[pmtID], vertex) / C_WATER;
}

float NTagEventInfo::GetTRMS(const std::vector<float>& T)
{
    int   nHits  = T.size();
    float tMean = 0.;
    float tVar  = 0.;

    for (int iHit = 0; iHit < nHits; iHit++)
        tMean += T[iHit] / nHits;
    for (int iHit = 0; iHit < nHits; iHit++)
        tVar += (T[iHit]-tMean)*(T[iHit]-tMean) / nHits;

    return sqrt(tVar);
}

float NTagEventInfo::GetTRMSFromStartIndex(const std::vector<float>& T, int startIndex, float tWidth)
{
    int nHits = T.size();
    int searchIndex = startIndex;
    std::vector<float> tList;

    while (1) {
        tList.push_back(T[searchIndex]);
        searchIndex++;
        if ((searchIndex > nHits -1) || (TMath::Abs((T[searchIndex] - T[startIndex])) > tWidth))
            break;
    }

    return GetTRMS(tList);
}

int NTagEventInfo::GetNhitsFromCenterTime(const std::vector<float>& T, float centerTime, float tWidth)
{
    int NXX = 0;

    for (const auto& t: T) {
        if (t < centerTime - tWidth/2.) continue;
        if (t > centerTime + tWidth/2.) break;
        NXX++;
    }

    return NXX;
}

int NTagEventInfo::IsCapture(int candidateID, bool bSave)
{
    float tRecon = ReconCaptureTime(candidateID);

    if (nAllSec >= MAXNSCNDPRT) return -1;
    for (int iCapture = 0; iCapture < nTrueCaptures; iCapture++) {
        if (fabs(vTrueCT[iCapture] - tRecon) < TMATCHWINDOW ) {
            if (bSave) vCandidateID.push_back(candidateID);
            return 1;
        }
    }
    return 0;
}

int NTagEventInfo::IsGdCapture(int candidateID)
{
    float tRecon = ReconCaptureTime(candidateID);

    if (nAllSec >= MAXNSCNDPRT) return -1;
    for (int iCapture = 0; iCapture < nTrueCaptures; iCapture++) {
        if (fabs(vTrueCT[iCapture] - tRecon) < TMATCHWINDOW ) {
            if (vTotGammaE[iCapture] > 6.) return 1;
            else return 0;
        }
    }

    return -9999;
}

void NTagEventInfo::Clear()
{
    runNo = 0; subrunNo = 0; eventNo = 0; nhitac = 0; nqiskz = 0; trgType = 0;
    trgOffset = 1000; qismsk = 0;
    apNRings = 0; apNMuE = 0; apNDecays = 0;
    evis = 0; pvx = 0; pvy = 0; pvz = 0; dWall = 0;
    nCandidates = 0; maxN200 = 0;
    maxN200Time = -9999.; firstHitTime_ToF = -9999.;

    nTrueCaptures = 0;
    nSavedSec = 0; nAllSec = 0;
    nNInNeutVec = neutIntMode = nVecInNeut = 0;
    neutIntMom = 0;
    nVec = 0;
    vecx = 0; vecy = 0; vecz = 0;

    vTISKZ.clear(); vQISKZ.clear(); vCABIZ.clear();

    vSortedPMTID.clear();
    vSortedT_ToF.clear(); vUnsortedT_ToF.clear(); vSortedQ.clear();

    vAPRingPID.clear(); vAPMom.clear(); vAPMomE.clear(); vAPMomMu.clear();
    vFirstHitID.clear(); vN10n.clear(); vN1300.clear();
    vTRMS10n.clear(); vTRMS50.clear();
    vReconCTn.clear(); vNvx.clear(); vNvy.clear(); vNvz.clear();
    vDoubleCount.clear();
    vBSvx.clear(); vBSvy.clear(); vBSvz.clear(); vBSReconCT.clear();
    vBeta14_10.clear(); vBeta14_50.clear();
    vTMVAOutput.clear();
    TMVATools.fVariables.Clear();

    vNGamma.clear(); vCandidateID.clear();
    vTrueCT.clear(); vCapVX.clear(); vCapVY.clear(); vCapVZ.clear(); vTotGammaE.clear();
    vIsGdCapture.clear(); vIsCapture.clear();
    vTrueCapVX.clear(); vTrueCapVY.clear(); vTrueCapVZ.clear(); vCTDiff.clear();
    vSecPID.clear(); vSecIntID.clear(); vParentPID.clear(); vCapID.clear();
    vSecVX.clear(); vSecVY.clear(); vSecVZ.clear(); vSecPX.clear(); vSecPY.clear(); vSecPZ.clear();
    vSecDWall.clear(); vSecMom.clear(); vSecT.clear();

    vNeutVecPID.clear();
    vVecPID.clear();
    vVecPX.clear(); vVecPY.clear(); vVecPZ.clear(); vVecMom.clear();
}

void NTagEventInfo::SaveSecondary(int secID)
{
    vSecPID.push_back ( secndprt_.iprtscnd[secID]         );  // PID of secondaries
    vSecIntID.push_back ( secndprt_.lmecscnd[secID]         );  // creation process
    vParentPID.push_back ( secndprt_.iprntprt[secID]         );  // parent PID
    vSecVX.push_back ( secndprt_.vtxscnd[secID][0]       );  // creation vertex
    vSecVY.push_back ( secndprt_.vtxscnd[secID][1]       );
    vSecVZ.push_back ( secndprt_.vtxscnd[secID][2]       );
    vSecDWall.push_back ( wallsk_(secndprt_.vtxscnd[secID]) );  // distance from wall to creation vertex
    vSecPX.push_back   ( secndprt_.pscnd[secID][0]         );  // momentum vector
    vSecPY.push_back   ( secndprt_.pscnd[secID][1]         );
    vSecPZ.push_back   ( secndprt_.pscnd[secID][2]         );
    vSecMom.push_back ( Norm(secndprt_.pscnd[secID])      );  // momentum
    vSecT.push_back    ( secndprt_.tscnd[secID]            );  // time created
    vCapID.push_back( -1 );
    nSavedSec++;
    
    msg.Print(Form("Saved secondary %d: [PID: %d] [Int code: %d] [Parent PID: %d] [x: %f y: %f z: %f]", 
                    secID, 
                    secndprt_.iprtscnd[secID], 
                    secndprt_.lmecscnd[secID],
                    secndprt_.iprntprt[secID], 
                    secndprt_.vtxscnd[secID][0], 
                    secndprt_.vtxscnd[secID][1], 
                    secndprt_.vtxscnd[secID][2]), pDEBUG);
}

void NTagEventInfo::SavePeakFromHit(int hitID)
{
    // Calculate betas
    float t0      = vSortedT_ToF[hitID];
    int   N10i    = GetNhitsFromStartIndex(vSortedT_ToF, hitID, 10.);
    int   N200    = GetNhitsFromCenterTime(vSortedT_ToF, t0 + 5., 200.);
    auto  beta    = GetBetaArray(vSortedPMTID, hitID, N10i);
    float tEnd    = vSortedT_ToF[hitID+N10i-1];
    float sumQ    = GetQSumFromStartIndex(vSortedT_ToF, vSortedQ, hitID, 10.);
    float trms    = GetTRMSFromStartIndex(vSortedT_ToF, hitID, 10.);

    if ((N10i >= N10TH) && (N10i < N10MX+1)) {
        // Save info
        vFirstHitID.push_back   ( hitID               );
        vBeta14_10.push_back( beta[1] + 4*beta[4] );

        TMVATools.fVariables.PushBack("N10", N10i);
        TMVATools.fVariables.PushBack("N200", N200);
        TMVATools.fVariables.PushBack("QSum10", sumQ);
        TMVATools.fVariables.PushBack("ReconCT", (t0 + tEnd)/2.);
        TMVATools.fVariables.PushBack("TSpread10", tEnd - t0);
        TMVATools.fVariables.PushBack("TRMS10", trms);

        // Increment number of neutron candidates
        nCandidates++;
    }
}