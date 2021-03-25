Scriptname _Lull_LlavadosLetterScript Extends ObjectReference

Quest Property MQ01Startup Auto

bool doOnce = FALSE


Event OnRead()

	If !doOnce
		MQ01Startup.SetStage(15)
		doOnce = TRUE
	EndIf
	
EndEvent
