;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__0403E198 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
GetOwningQuest().SetStage(21)
akSpeaker.DisableNoWait(1)
grateDoor.DisableNoWait(1)
llavados.MoveTo(boxMarker)
magicSound.Play(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
ObjectReference Property grateDoor auto
ObjectReference Property boxMarker auto
Actor Property llavados auto
Sound Property magicSound auto