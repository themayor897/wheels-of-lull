;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname QF__Lull_MQ05_04005911 Extends Quest Hidden

;BEGIN ALIAS PROPERTY _MQ04_Fyr
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ04_Fyr Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LocationCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LocationCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY _MQ04_Numinar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ04_Numinar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Location
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Location Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY _MQ04_Yagrum
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ04_Yagrum Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE _Lull_MQ04_Startup
Quest __temp = self as Quest
_Lull_MQ04_Startup kmyQuest = __temp as _Lull_MQ04_Startup
;END AUTOCAST
;BEGIN CODE
Debug.MessageBox("You feel the world start to shift once more.")
kmyQuest.numinar.moveto(Game.GetPlayer())
kmyQuest.numinar.PlaceAtMe(kmyQuest.TeleportMarker)
kmyQuest.numinar.enable()
kmyQuest.numinar.evaluatepackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
