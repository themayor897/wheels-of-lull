Scriptname WoL extends Quest
{Controls logging function for Wheels of Lull. Made with help from Pickysaurus.}

Import Debug

bool Function ToggleLog(bool bStop = false) Global
	if bStop
		TraceUser("WheelsOfLull","[WHEELS OF LULL LOGGING STOPPED]")
		CloseUserLog("WheelsofLull")
		Trace("Wheels of Lull Debug Logging stopped.")
		Return True
	else
		Utility.SetINIBool("bEnableTrace:Papyrus", true)
		OpenUserLog("WheelsofLull")
		TraceUser("WheelsOfLull","[WHEELS OF LULL LOGGING INITIATED]")
		Trace("Wheels of Lull Debug Logging started.")
		Return True
	endif
	
	Return False
EndFunction

Function Log(Form Sender, String sMessage, Int iSeverity = 0) Global
	TraceUser("WheelsofLull",Sender + " - " + sMessage, iSeverity)
	if (iSeverity == 1)
		Trace("Wheels of Lull [[WARNING]] - " + sMessage, iSeverity)
	elseif (iSeverity == 2)
		Trace("Wheels of Lull [[ERROR]] - " + sMessage, iSeverity)
	endif
EndFunction 