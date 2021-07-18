Scriptname _Lull_PneumaSteal extends ObjectReference 
Race property chronoRace auto 

EVENT OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)

    if (akOldContainer as actor)&&(akNewContainer as actor)
        actor oldHost = (akOldContainer as actor)
        actor killer = (akNewContainer as actor)
        if (oldHost.GetRace() == chronoRace)
             ActorBase oldHostBase  = oldHost.GetBaseObject() as ActorBase 
            if !oldHost.isDead() && !oldHostBase.isUnique()
                oldHost.Kill(killer)
            endif

            while utility.isInMenuMode()
                utility.wait(0.1)
            endWhile
        endif
    endif
    if (akNewContainer as actor)
        actor newHost = (akNewContainer as actor) 
        if newHost.isDead() && (newHost.GetRace() == chronoRace)
            newHost.resurrect()
        endif
    endif
    
endEVENT