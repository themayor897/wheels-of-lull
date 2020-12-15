Scriptname _Lull_MQ06_ThalmorUtility extends Quest  Conditional

GlobalVariable Property ThalmorKilled  Auto  Conditional
GlobalVariable Property ThalmorTotal  Auto  Conditional

Function ThalmorCount()
; 	debug.trace("ThalmorCount" + Self)
	ModObjectiveGlobal(1, ThalmorKilled)
	if ThalmorKilled.value == ThalmorTotal.value	
		SetStage(14)
	endif
EndFunction
