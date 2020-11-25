Scriptname _Lull_EternityNote extends ObjectReference  

Quest Property Mines Auto

bool doOnce = false
bool doOnce2 = false

Event OnRead()
	if !doOnce
		Mines.SetObjectiveCompleted(1)
		Mines.SetStage(2)
		Mines.SetObjectiveDisplayed(2)
		doOnce = true
	endif
EndEvent
		