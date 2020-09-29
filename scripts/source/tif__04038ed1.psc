;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__04038ED1 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
GetOwningQuest().SetStage(16)
Fyr.EnableNoWait()
Yagrum.EnableNoWait()
Fyr.MoveTo(FyrMarker)
Yagrum.MoveTo(YagrumMarker)
Fyr.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
Actor Property Fyr auto
Actor Property Yagrum auto
ObjectReference Property FyrMarker auto
ObjectReference Property YagrumMarker auto