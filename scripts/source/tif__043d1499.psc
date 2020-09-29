;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__043D1499 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Game.GetPlayer().AddItem(craftedItem, 1)
Game.GetPlayer().RemoveItem(item1, 8)
Game.GetPlayer().RemoveItem(item2, 2)
Game.GetPlayer().RemoveItem(item3, 1)
Game.GetPlayer().RemoveItem(item4, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
Armor Property craftedItem auto
MiscObject Property item1 auto
MiscObject Property item2 auto
MiscObject Property item3 auto
MiscObject Property item4 auto