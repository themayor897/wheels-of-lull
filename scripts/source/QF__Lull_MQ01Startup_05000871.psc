;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname QF__Lull_MQ01Startup_05000871 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Container
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Container Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Lull_MQ01SU_Llavados
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Lull_MQ01SU_Llavados Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Location
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Location Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Letter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Letter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LocationCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LocationCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Starts MQ01, makes sure player is outside in a settlement

_Lull_MQ01.Start()
_Lull_WorldShift01.Show()
Alias_Lull_MQ01SU_Llavados.getReference().moveto(Alias_LocationCenterMarker.getReference())
Alias_Lull_MQ01SU_Llavados.getReference().enable()
RegisterForUpdate(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
(WICourier as WICourierScript).removeRefFromContainer(Alias_Letter.GetRef())
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
SetObjectiveDisplayed(15)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
(WICourier as WICourierScript).AddAliasToContainer(Alias_Letter)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property _Lull_MQ01  Auto  

Message Property _Lull_WorldShift01  Auto  

ObjectReference Property PlayerRef  Auto  

Quest Property WICourier  Auto  
