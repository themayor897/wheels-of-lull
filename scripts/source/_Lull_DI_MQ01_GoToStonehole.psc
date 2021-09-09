;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname _Lull_DI_MQ01_GoToStonehole Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
_Lull_MQ01.SetObjectiveCompleted(10)
Utility.waitgametime(12)
if (_Lull_MQ01.GetStage() <= 20) 
_Lull_Actor_Llavados.MoveToMyEditorLocation()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
_Lull_MQ01.setstage(12)
_Lull_MQ01.SetObjectiveDisplayed(12)
StoneHoleMine.AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
ObjectReference Property StoneHoleMine auto

Actor Property _Lull_ACTOR_Llavados  Auto  

Quest Property _Lull_MQ01  Auto  
