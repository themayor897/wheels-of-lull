;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF__Lull_SQ_ArcheronMines_05005921 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Mines_Teleport
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Mines_Teleport Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Mines_Instructions
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Mines_Instructions Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Mines_Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Mines_Player Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectiveCompleted(7)
CompleteQuest()
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
