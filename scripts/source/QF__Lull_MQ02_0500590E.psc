;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname QF__Lull_MQ02_0500590E Extends Quest Hidden

;BEGIN ALIAS PROPERTY _MQ02_College
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ02_College Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY _MQ02_Thalmor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ02_Thalmor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY _MQ02_LlavadosTalker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ02_LlavadosTalker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY _MQ02_Numinar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ02_Numinar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY _MQ02_HighHrothgar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ02_HighHrothgar Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
Alias__MQ02_College.trytoenable()
Alias__MQ02_Thalmor.trytoenable()
Alias__MQ02_HighHrothgar.trytoenable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
