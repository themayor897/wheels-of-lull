;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__0429596F Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
GetOwningQuest().setStage(4)
cartWright.DisableNoWait()
Game.ShakeCamera()
Utility.Wait(3)
Game.GetPlayer().MoveTo(CartCell)
ExitTram.Show()
getOwningQuest().SetObjectiveCompleted(1)
getOwningQuest().CompleteQuest()
getOwningQuest().stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
ObjectReference Property CartCell auto
ObjectReference Property cartWright  Auto  

Message Property ExitTram  Auto  