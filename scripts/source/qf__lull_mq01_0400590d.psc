;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 24
Scriptname QF__Lull_MQ01_0400590D Extends Quest Hidden

;BEGIN ALIAS PROPERTY _Lull_LlavadosTalker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__Lull_LlavadosTalker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY _Lull_MQ01_Llavados
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__Lull_MQ01_Llavados Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LocationCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LocationCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY _Lull_MQ01_MapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__Lull_MQ01_MapMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Location
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Location Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY _Lull_MarkerLlavadosBody
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__Lull_MarkerLlavadosBody Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY _Lull_ElevatorMQ01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__Lull_ElevatorMQ01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY _Lull_MQ01_Pneuma
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__Lull_MQ01_Pneuma Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
SetObjectiveCompleted(10)
_Lull_MQ01_ExplainLlavados1.start()
Llavados.SetEssential(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
setobjectivecompleted(12)
setobjectivedisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
_Lull_MQ01_ExplainLlavados2.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
_Lull_MQ01_ExplainLlavados4.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
_Lull_MQ01_ExplainLlavados3.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
_Lull_MQ01_Poltergeists.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
_Lull_MQ01_OldLift.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
;Stage set in Dialogue Topic _Lull_MQ01_TakeSomething, DI_MQ01_TakePneuma

Llavados.SetEssential(False)
LlavadosREF.kill()
doorMine.Lock(false)
SetObjectiveDisplayed(10)

If MQ01Startup.IsRunning()
MQ01Startup.SetStage(100)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property _Lull_MQ01_ExplainLlavados1  Auto
Scene Property _Lull_MQ01_ExplainLlavados2  Auto  
Scene Property _Lull_MQ01_ExplainLlavados3  Auto  
Scene Property _Lull_MQ01_ExplainLlavados4  Auto  
Scene Property _Lull_MQ01_OldLift Auto
Scene Property _Lull_MQ01_Poltergeists Auto 

Message Property _Lull_WorldShift01  Auto  

Quest Property MQ01Startup  Auto  

ActorBase Property llavados  Auto  

ObjectReference Property doorMine  Auto  

Actor Property LlavadosREF  Auto  
