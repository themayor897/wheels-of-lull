;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__0402428A Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
GetOwningQuest().SetStage(65)
guardF.MoveTo(guardFLocation)
avarri.MoveTo(avarriMLocation)
llavados.MoveTo(llavLocation)
subori.MoveTo(suboriLocation)
akSpeaker.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
ObjectReference Property guardFLocation auto
ObjectReference Property avarriMLocation auto
ObjectReference Property llavLocation auto
ObjectReference Property suboriLocation auto
Actor Property guardF auto
Actor Property avarri auto
Actor Property llavados auto
Actor Property subori auto