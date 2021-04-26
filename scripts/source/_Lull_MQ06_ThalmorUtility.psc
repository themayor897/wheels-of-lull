Scriptname _Lull_MQ06_ThalmorUtility extends Quest  Conditional

GlobalVariable Property ThalmorKilled  Auto  Conditional
GlobalVariable Property ThalmorTotal  Auto  Conditional

Function ThalmorCount()
 	ModObjectiveGlobal(1, ThalmorKilled)
	WoL.Log(self, (ThalmorKilled.getvalue() as int) as string + "/" + (ThalmorKilled.getvalue() as int) as string + " thalmor killed.")
	if ThalmorKilled.value == ThalmorTotal.value	
		SetStage(14)
	endif
EndFunction
