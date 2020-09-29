;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__0429596E Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
getOwningQuest().setStage(4)
akSpeaker.DisableNoWait()
Game.ShakeCamera()
Utility.Wait(3)
Game.GetPlayer().MoveTo(CartCell)
Debug.MessageBox("You exit the tram.")
getOwningQuest().SetObjectiveCompleted(1)
getOwningQuest().CompleteQuest()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
ObjectReference Property CartCell auto