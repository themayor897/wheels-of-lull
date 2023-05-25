;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__043D6672 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
getOwningQuest().setStage(21)
GetOwningQuest().CompleteQuest()
Game.GetPlayer().AddItem(thomasbook, 1)
if WailwayQuest.getStage()==10
WailwayQuest.setObjectiveCompleted(10)
WailwayQuest.setStage(11)
wailwayQuest.setObjectiveDisplayed(11)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
Book Property thomasbook auto
Quest Property WailwayQuest  Auto  
