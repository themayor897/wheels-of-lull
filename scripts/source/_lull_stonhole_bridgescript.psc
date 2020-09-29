Scriptname _Lull_Stonhole_BridgeScript extends ObjectReference  

ObjectReference Property BridgePiece auto
bool doOnce = FALSE

Event OnActivate(ObjectReference akActionRef)
	if(!doOnce)
		BridgePiece.EnableNoWait()
		Game.ShakeCamera()	
		doOnce = TRUE
	endif
EndEvent