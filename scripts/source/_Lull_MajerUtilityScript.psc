Scriptname _Lull_MajerUtilityScript extends Quest  Conditional

GlobalVariable Property MajersKilled  Auto  Conditional
GlobalVariable Property MajersTotal  Auto  Conditional

Function MajCount()
; 	debug.trace("MajCount" + Self)
	ModObjectiveGlobal(1, MajersKilled)
	if MajersKilled.value == MajersTotal.value	
		SetStage(10)
	endif
EndFunction

