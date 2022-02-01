Scriptname _lull_returntolullmor extends ObjectReference  
actor property playerRef auto 
ObjectReference property lullMorMarker Auto
event OnActivate(ObjectReference akActionRef)
    playerRef.moveto(lullMorMarker)
    EndEvent