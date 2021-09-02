#ifndef EVENTNTAGMANAGER_HH
#define EVENTNTAGMANAGER_HH

#include "TMVA/Reader.h"

#include "PMTHitCluster.hh"
#include "ParticleCluster.hh"
#include "TaggableCluster.hh"
#include "CandidateCluster.hh"
#include "Printer.hh"
#include "Store.hh"

enum VertexMode
{
    mNONE,
    mAPFIT,
    mBONSAI,
    mCUSTOM,
    mTRUE,
    mSTMU
};

enum TriggerType
{
    tELSE,
    tSHE,
    tAFT
};

class EventNTagManager
{
    public:
        EventNTagManager(Verbosity verbose=pDEFAULT);
        ~EventNTagManager();
        
        // read ingredients from sk common blocks
        void ReadVariables();
        void ReadHits();
        void ReadParticles();
        void ReadEarlyCandidates();
        void ReadEventFromCommon();
        
        void SearchCandidates();
        
        // set ingredients manually
        void ClearData();
        void ApplySettings();
        void InitializeTMVA();
        // void SetHits(PMTHitCluster&);
        // void SetMCParticles(ParticleCluster&);
        // void SetVariables();
        
        // return private members
        const Store& GetVariables() { return fEventVariables; };
        const PMTHitCluster& GetHits() { return fEventHits; };
        const ParticleCluster& GetParticles() { return fEventParticles; }
        const TaggableCluster& GetTaggables() { return fEventTaggables; }
       // const NCaptureCluster& GetNCaptures() { return fEventNCaptures; }
        const CandidateCluster& GetCandidates() { return fEventCandidates; }
        const CandidateCluster& GetEarlyCandidates() { return fEventEarlyCandidates; }

        //const CandidateCluster& GetCandidates(const PMTHitCluster& hitCluster);
        
        // setters
        void SetVerbosity(Verbosity verbose) { fMsg.SetVerbosity(verbose); }
        template <typename T>
        void Set(std::string key, T value) { fSettings.Set(key, value); ApplySettings(); }
        
        // tmva
        float GetTMVAOutput(Candidate& candidate);
        
        // root
        void SetTree(TTree* tree) { fOutputTree = tree; }
        void FillTree();
        void WriteRegisteredTrees();
        
        // printers
        void DumpSettings() { fSettings.Print(); }
        void DumpEvent();

    private:
        void SubtractToF();
        void FindFeatures(Candidate& candidate);
        void MapTaggables();
        void MapTaggable(Taggable& taggable, int iCandidate, const std::string& key);
        void MapCandidateClusters(CandidateCluster& candidateCluster);
        void PruneCandidates();
        int GetMaxNHitsIndex(PMTHitCluster& hitCluster);
        
    
        // DataModel:
        Store fEventVariables;
        PMTHitCluster fEventHits;
        ParticleCluster fEventParticles;
        TaggableCluster fEventTaggables;
        //NCaptureCluster fEventNCaptures;
        CandidateCluster fEventCandidates;
        CandidateCluster fEventEarlyCandidates;
        
        // NTag settings
        Store fSettings;
        float T0TH, T0MX, TWIDTH, TMINPEAKSEP, TMATCHWINDOW;
        int NHITSTH, NHITSMX, N200TH, N200MX;
        float INITGRIDWIDTH, MINGRIDWIDTH, GRIDSHRINKRATE, VTXSRCRANGE;
        
        // TMVA
        TMVA::Reader fTMVAReader;
        std::map<std::string, float> fFeatureContainer;
        int fCandidateCaptureType;
        
        // ROOT
        bool fIsBranchSet;
        TTree* fOutputTree;

        // Utilities
        Printer fMsg;
};

#include "TSysEvtHandler.h"

class TInterruptHandler : public TSignalHandler
{
   public:
        TInterruptHandler(EventNTagManager* manager):TSignalHandler(kSigInterrupt, kFALSE)
        { fNTagManager = manager; }

        virtual Bool_t Notify()
        {
            std::cerr << "Received SIGINT. Writing output..." << std::endl;
            fNTagManager->WriteRegisteredTrees();
            _exit(2);
            return kTRUE;
        }

    private:
        EventNTagManager* fNTagManager;
};

#endif