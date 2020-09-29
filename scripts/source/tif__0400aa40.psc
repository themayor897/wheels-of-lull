;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__0400AA40 Extends TopicInfo Hidden

ObjectReference Property mapMarkerRef auto
MiscObject Property glowyBit auto
ObjectReference Property doorMine auto

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
akSpeaker.GetActorBase().SetEssential(False)
akSpeaker.kill()
akSpeaker.AddItem(glowyBit, 1)
doorMine.Lock(false)
GetOwningQuest().SetStage(10)
GetOwningQuest().SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

