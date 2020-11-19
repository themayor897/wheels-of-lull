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

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if !doOnce2
		if akNewContainer == Game.GetPlayer()
			Mines.SetStage(1)
			Mines.SetObjectiveDisplayed(1)
			doOnce2 = true
		endif
	endif
EndEvent
		