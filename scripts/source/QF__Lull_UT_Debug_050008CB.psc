;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF__Lull_UT_Debug_050008CB Extends Quest Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;turn off
_Lull_DebugLogging.SetValue(0)

if !WoL.ToggleLog(true)
	WoL.Log(Self, "Failed to deactivate debug logging.")
endif

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;turn on
_Lull_DebugLogging.SetValue(1)

if WoL.ToggleLog()
	WoL.Log(Self, "Wheels of Lull v"+_Lull_Version.GetValue() as Int)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property _lull_DebugLogging  Auto  

GlobalVariable Property _Lull_Version  Auto  
