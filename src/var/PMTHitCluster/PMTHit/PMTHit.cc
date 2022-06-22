#include "SKLibs.hh"
#include "PMTHit.hh"
#include "PMTHitCluster.hh"

PMTHit::PMTHit(Float t, float q, int i, int f)
: fT(t), fToF(0), fQ(q), fPMTID(i), fFlag(f), fIsSignal(false), fIsBurst(false)
{
    if (1 <= fPMTID && fPMTID <= MAXPM) {
        fPMTPosition = TVector3(NTagConstant::PMTXYZ[fPMTID-1]);
    }
    else {
        fPMTPosition = TVector3();
    }
}

/*
void PMTHit::FindMinAngle(PMTHitCluster* cluster)
{
    float minAngle = 180;
    for (auto const& hit: *cluster) {
        // exclude itself
        if (hit.i()==fPMTID && hit.q()==fQ && hit.t()==fT) continue;

        float angle = fHitDirection.Angle(hit.GetDirection());
        if (angle < minAngle)
            minAngle = angle;
    }
    fMinAngle = minAngle;
}

void PMTHit::FindDirAngle(TVector3 vec)
{
    fDirAngle = fHitDirection.Angle(vec);
}

void PMTHit::FindAcceptance()
{
    // where to get the correct attLength?
    float attLenght = 9000;

    float dist = NTagConstant::C_WATER * fToF;
    TVector3 normalDir;
    
    if (fabs(fPMTPosition.z()) < 1800)
        normalDir = TVector3(fPMTPosition.x(), fPMTPosition.y(), 0);
    else
        normalDir = TVector3(0, 0, fPMTPosition.z());

    float cosTheta = cos(fHitDirection.Angle(normalDir));
    
    fAcceptance = coseffsk_(&cosTheta) * exp(-dist/attLenght)/dist/dist;
}
*/
PMTHit& PMTHit::operator+=(const Float& time)
{
    fT += time;
    return *this;
}

PMTHit& PMTHit::operator-=(const Float& time)
{
    fT -= time;
    return *this;
}

PMTHit operator+(const PMTHit& hit, const Float& time)
{
    PMTHit newHit = hit;
    newHit += time;
    return newHit;
}

PMTHit operator-(const PMTHit& hit, const Float& time)
{
    PMTHit newHit = hit;
    newHit -= time;
    return newHit;
}