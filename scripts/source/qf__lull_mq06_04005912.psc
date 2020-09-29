;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname QF__Lull_MQ06_04005912 Extends Quest Hidden

;BEGIN ALIAS PROPERTY MQ06_Numinar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MQ06_Numinar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MQ06_Yagrum
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MQ06_Yagrum Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LocationCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LocationCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Location
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Location Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MQ06_Fyr
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MQ06_Fyr Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE _lull_mq06_masterscript
Quest __temp = self as Quest
_lull_mq06_masterscript kmyQuest = __temp as _lull_mq06_masterscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.lullTalkyActivator3.MoveTo(Game.GetPlayer())
Game.GetPlayer().PlaceAtMe(kmyQuest.teleportMarker, 1)
kmyQuest.mq06.SetStage(5)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
