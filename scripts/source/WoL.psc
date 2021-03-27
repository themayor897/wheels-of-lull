Scriptname WoL extends Quest
{Controls logging function for Wheels of Lull. Made with help from Pickysaurus.}

Import Debug

Function OpenLog() Global
	Utility.SetINIBool("bEnableTrace:Papyrus", true)
	OpenUserLog("WheelsofLull")
	TraceUser("WheelsOfLull","[WHEELS OF LULL LOGGING INITIATED]")
EndFunction

Bool Function CloseLog() Global
	TraceUser("WheelsOfLull","[WHEELS OF LULL LOGGING STOPPED]")
	CloseUserLog("WheelsofLull")
	Return True
EndFunction

Function Log(Form Sender, String sMessage, Int iSeverity = 0) Global
	TraceUser("WheelsofLull",Sender + " - " + sMessage, iSeverity)
	if (iSeverity == 1)
		Trace("Wheels of Lull [[WARNING]] - " + sMessage, iSeverity)
	elseif (iSeverity == 2)
		Trace("Wheels of Lull [[ERROR]] - " + sMessage, iSeverity)
	endif
EndFunction 