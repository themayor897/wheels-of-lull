Scriptname _Lull_MajerUtilityScript extends Quest  Conditional

;Created for Lull 5.0.0 by themayor897.
;themayor897 added logging functions 4.20.21

GlobalVariable Property MajersKilled  Auto  Conditional
GlobalVariable Property MajersTotal  Auto  Conditional

Function MajCount()
	WoL.Log(self, "Majer Count gloabal +1")
	ModObjectiveGlobal(1, MajersKilled)
	if MajersKilled.value == MajersTotal.value	
		SetStage(10)
	endif
EndFunction

