;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__0403E185 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;Game.GetPlayer().MoveTo(PlayerCellMarker)
bottomFact.SendPlayertoJail(abRemoveInventory=False) 
Fyr.MoveTo(FyrMarker)
Yagrum.MoveTo(YagrumMarker)
GetOwningQuest().SetStage(18)
Fyr.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
;ObjectReference Property PlayerCellMarker auto
ObjectReference Property FyrMarker auto
ObjectReference Property YagrumMarker auto

Actor Property Fyr Auto
Actor Property Yagrum Auto
Faction Property bottomFact auto