;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__04267B0F Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Game.GetPlayer().AddItem(craftedItem, 10)
Game.GetPlayer().RemoveItem(item1, 1)
Game.GetPlayer().RemoveItem(item2, 10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
Ammo Property craftedItem auto
MiscObject Property item1 auto
Ammo Property item2 auto