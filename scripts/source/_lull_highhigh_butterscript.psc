Scriptname _Lull_HighHigh_ButterScript extends Quest  

GlobalVariable Property butterVariable auto  conditional
GlobalVariable Property ButterTotal Auto Conditional

Function ButterCount()
	ModObjectiveGlobal(1, butterVariable)
	if butterVariable.value == ButterTotal.value
		SetStage(15)
		SetObjectiveCompleted(10)
		SetObjectiveDisplayed(15)
	endif
EndFunction 