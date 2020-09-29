Scriptname _Lull_ReturnToSea extends ObjectReference  
ObjectReference Property returnMarker auto
Quest Property deepSea auto
Event OnActivate(ObjectReference akActionRef)
	deepSea.CompleteQuest()
	Game.GetPlayer().Moveto(returnMarker)
EndEvent
