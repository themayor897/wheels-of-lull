;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__04267AFF Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
playerRef.AddItem(craftedItem, 1)
playerRef.RemoveItem(item1, 1)
playerRef.RemoveItem(item2, 3)
playerRef.RemoveItem(item3, 2)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
Weapon Property craftedItem auto
Weapon Property item1 auto
MiscObject Property item2 auto
MiscObject Property item3 auto
Actor Property PlayerRef  Auto  
