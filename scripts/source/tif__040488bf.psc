;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__040488BF Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
akSpeaker.RemoveItem(cuttingSphere, 1)
akSpeaker.AddItem(harquebus, 1)
Game.GetPlayer().AddItem(cuttingSphere, 1)
Game.GetPlayer().RemoveItem(harquebus, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
Weapon Property cuttingSphere auto
Weapon Property harquebus auto