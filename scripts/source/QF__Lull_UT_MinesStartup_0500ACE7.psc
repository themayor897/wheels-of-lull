;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF__Lull_UT_MinesStartup_0500ACE7 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Mines_BlueFRF
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Mines_BlueFRF Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
MinesQuest.SetStage(1)
MinesQuest.SetObjectiveDisplayed(1)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Alias_Mines_BlueFRF.trytoenable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


Quest Property MinesQuest  Auto  
