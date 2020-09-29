Scriptname _Lull_AtlantanPneuma extends ObjectReference  

MiscObject Property llavPneuma auto
Quest Property deepSea auto
ObjectReference Property barrier auto



Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	MiscObject akMisc = akBaseItem as MiscObject
	if(akMisc == llavPneuma)
		barrier.DisableNoWait()
		deepSea.SetStage(7)
		deepSea.SetObjectiveCompleted(5)
		deepSea.SetObjectiveDisplayed(7)

	endif
EndEvent