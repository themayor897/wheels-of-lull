;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname QF__Lull_MQ05_04005911 Extends Quest Hidden

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

;BEGIN ALIAS PROPERTY _MQ04_Fyr
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ04_Fyr Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
_Lull_WorldShift02.Show()
numinar.moveto(Game.GetPlayer())
numinar.PlaceAtMe(TeleportMarker)
numinar.enable()
numinar.evaluatepackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;started via Old Tho Mahalis Script
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Actor Property numinar auto
Activator Property TeleportMarker auto

Message Property _Lull_WorldShift02  Auto  
