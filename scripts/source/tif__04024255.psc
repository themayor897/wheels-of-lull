;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__04024255 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
PortalBeam.EnableNoWait(1)
Portal.EnableNoWait(1)
portalSound.Play(Game.GetPlayer())
Game.ShakeCamera()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
Sound Property portalSound auto
ObjectReference Property Portal auto
ObjectReference Property PortalBeam auto