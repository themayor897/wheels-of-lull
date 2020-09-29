;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__043D6689 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
GetOwningQuest().setStage(4)
Game.GetPlayer().RemoveItem(Snowberry, 2)
Game.GetPlayer().RemoveItem(DaedraHeart, 1)
Game.GetPlayer().RemoveItem(Lull_Stone, 1)
Game.GetPlayer().RemoveItem(waterBottle, 1)
Game.GetPlayer().AddItem(Lull_Potion, 1)
GetOwningQuest().SetObjectiveCompleted(3)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
Ingredient Property Snowberry auto
Ingredient Property DaedraHeart auto
MiscObject Property Lull_Stone auto
MiscObject Property Lull_Potion auto
MiscObject Property waterBottle auto