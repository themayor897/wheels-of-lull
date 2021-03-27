;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF__Lull_UT_Debug_050008CB Extends Quest Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
_Lull_DebugLogging.SetValue(0)

if !WoL.CloseLog()
	WoL.Log(Self, "Failed to deactive debug logging.")
endif

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
_Lull_DebugLogging.SetValue(1)

WoL.OpenLog()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property _lull_DebugLogging  Auto  
