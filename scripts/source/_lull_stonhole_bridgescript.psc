Scriptname _Lull_Stonhole_BridgeScript extends ObjectReference  

ObjectReference Property BridgePiece auto
ObjectReference Property myTrigger auto
Bool Property TriggersGhosts = FALSE auto
bool doOnce = FALSE
actor property playerRef auto
Event OnActivate(ObjectReference akActionRef)
    if(!doOnce)
        BridgePiece.EnableNoWait()
        Game.ShakeCamera()  
        if TriggersGhosts
            myTrigger.Activate(playerRef)
        endif
        doOnce = TRUE
    endif
EndEvent 