;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__04019E6F Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
GetOwningQuest().SetObjectiveCompleted(25)
if(Game.GetPlayer().GetItemCount(gemDiamond) >= 1)
    Game.GetPlayer().RemoveItem(gemDiamond, 1)
elseif(Game.GetPlayer().GetItemCount(gemDiamondFlawless) >= 1)
    Game.GetPlayer().RemoveItem(gemDiamondFlawless, 1)
endif
TalkActivator.DisableNoWait()
GetOwningQuest().SetStage(27)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
MiscObject Property gemDiamond auto
MiscObject Property gemDiamondFlawless auto

ObjectReference Property TalkActivator  Auto  
