;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__04267B0D Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
playerRef.AddItem(craftedItem, 1)
playerRef.RemoveItem(item1, 1)
playerRef.RemoveItem(item2, 1)
playerRef.RemoveItem(item3, 5)
playerRef.RemoveItem(item4, 3)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
Weapon Property craftedItem auto
Weapon Property item1 auto
Armor Property item2 auto
MiscObject Property item3 auto
Ingredient Property item4 auto
Actor Property PlayerRef  Auto  
