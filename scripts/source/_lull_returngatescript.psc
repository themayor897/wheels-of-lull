Scriptname _lull_returnGateScript extends ObjectReference  
ObjectReference Property returnMarker auto

Event OnActivate(ObjectReference akActionRef)
	Game.GetPlayer().Moveto(returnMarker)
EndEvent