#ifndef EVENTPARTICLES_HH
#define EVENTPARTICLES_HH

#include "Particle.hh"
#include "Cluster.hh"

class EventParticles : public Cluster<Particle> 
{
    public:
        EventParticles() {}
        
        void DumpAllElements();
    
    ClassDef(EventParticles, 1)
};

#endif