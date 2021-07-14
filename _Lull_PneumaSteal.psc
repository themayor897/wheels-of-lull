Scriptname _Lull_PneumaSteal extends ObjectReference 
Race property chronoRace auto 

EVENT OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)

    if (akOldContainer as actor)
        actor oldHost = (akOldContainer as actor)
        if (oldHost.getRace() == chronoRace)
             ActorBase oldHostBase  = oldHost.GetBaseObject() as ActorBase 
            if !oldHost.isDead() && !oldHostBase.isUnique()
                    oldHost.killEssential(akNewContainer as actor)
                 
            endif

            while utility.isInMenuMode()
                utility.wait(0.1)
            endWhile

        endif
    endif

endEVENT