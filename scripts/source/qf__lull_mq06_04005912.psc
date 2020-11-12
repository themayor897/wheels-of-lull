;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF__Lull_MQ06_04005912 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Location
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Location Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MQ06_Fyr
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MQ06_Fyr Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LocationCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LocationCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MQ06_Numinar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MQ06_Numinar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MQ06_Yagrum
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MQ06_Yagrum Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
lullTalkyActivator3.MoveTo(Game.GetPlayer())
lullTalkyActivator3.playAnimation("playAnim02")
SetStage(5)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

TalkingActivator Property lullTalky3 auto
Activator Property teleportMarker auto
ObjectReference Property lullTalkyActivator3 auto
