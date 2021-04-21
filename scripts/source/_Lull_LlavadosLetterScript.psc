Scriptname _Lull_LlavadosLetterScript Extends ObjectReference

;Created for v5.1 by themayor897. Modified 4.20.21 to add logging function

Quest Property MQ01Startup Auto

bool doOnce = FALSE


Event OnRead()

	If !doOnce
		MQ01Startup.SetStage(15)
		WoL.Log(self, "Player read Llavados' letter, MQ01Startup stage set to" + MQ01Startup.GetStage())
		doOnce = TRUE
	EndIf
	
EndEvent
