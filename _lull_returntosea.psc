Scriptname _Lull_ReturnToSea extends ObjectReference  
ObjectReference Property returnMarker auto
Quest Property deepSea auto
Actor property playerRef auto
Event OnActivate(ObjectReference akActionRef)
    deepSea.CompleteQuest()
    playerRef.Moveto(returnMarker)
EndEvent
