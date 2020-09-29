;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__04024278 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
GetOwningQuest().SetStage(55)
GetOwningQuest().SetObjectiveDisplayed(49)
GetOwningQuest().SetObjectiveDisplayed(50)
Game.GetPlayer().AddItem(visor, 1)
akSpeaker.MoveToMyEditorLocation()
lullWall.DisableNoWait()
lullWall3.DisableNoWait()
lullwall2.EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
Armor Property visor auto
ObjectReference Property lullWall auto
ObjectReference Property lullwall2 auto
ObjectReference Property lullWall3 auto
