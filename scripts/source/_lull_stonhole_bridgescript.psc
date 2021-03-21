Scriptname _Lull_Stonhole_BridgeScript extends ObjectReference  

ObjectReference Property BridgePiece auto
ObjectReference Property myTrigger auto
Bool Property TriggersGhosts = FALSE auto
bool doOnce = FALSE

Event OnActivate(ObjectReference akActionRef)
	if(!doOnce)
		BridgePiece.EnableNoWait()
		Game.ShakeCamera()	
		if TriggersGhosts
			myTrigger.Activate(Game.GetPlayer())
		endif
		doOnce = TRUE
	endif
EndEvent 