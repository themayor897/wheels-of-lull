;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__04019E60 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
getowningquest().setstage(20)
GetOwningQuest().SetObjectiveCompleted(5)
GetOwningQuest().SetObjectiveDisplayed(20)
GetOwningQuest().SetObjectiveDisplayed(21)
GetOwningQuest().SetObjectiveDisplayed(22)
elevatorBarrier.DisableNoWait(1)
LullPingEnable.EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property elevatorBarrier auto

ObjectReference Property LullPingEnable  Auto  
