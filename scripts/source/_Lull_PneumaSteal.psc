Scriptname _Lull_PneumaSteal extends ObjectReference 
Race property chronoRace auto 

EVENT OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)

    if (akOldContainer as actor)

;       ; debug.trace("Briarheart: Handle removal from an actor")
        actor oldHost = (akOldContainer as actor)
        if (oldHost.getRace() == chronoRace)
            if !oldHost.isDead()
                oldHost.kill(akNewContainer as actor)
            endif

            while utility.isInMenuMode()
                utility.wait(0.1)
            endWhile

        endif
    endif

endEVENT