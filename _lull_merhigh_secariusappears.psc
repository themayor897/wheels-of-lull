Scriptname _Lull_MerHigh_SecariusAppears extends ObjectReference  

Actor Property secarius auto
ObjectReference Property secMarker auto
ActorBase Property secariusBase auto
Quest Property mq03 auto
Actor property playerRef auto
bool doOnce = false
Event OnTriggerEnter(ObjectReference akActionRef)
    if(akActionRef == playerRef)
        if(MQ03.GetStage() == 60)
            if(!doOnce)
                secariusBase.setInvulnerable(false)
                secarius.EnableNoWait()
                secarius.MoveTo(secMarker)  
                doOnce = true
            endif
        endif
    endif
EndEvent