Scriptname _Lull_EternityNote extends ObjectReference  

Quest Property Mines Auto

bool doOnce = false

Event OnRead()
	if !doOnce
		Mines.SetStage(2)
		Mines.SetObjectiveDisplayed(2)
		doOnce = true
	endif
EndEvent