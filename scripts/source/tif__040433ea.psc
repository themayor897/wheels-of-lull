;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__040433EA Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
GetOwningQuest().SetStage(10)
GetOwningQuest().CompleteQuest()
llavados.DisableNoWait()
memory.DisableNoWait()
llavadosAccelerator.EnableNoWait()
myDoor.lock(False)
if(usedVariable.GetValue() >= 1)
 Game.GetPlayer().MoveTo(failmarker)
else
 Game.GetPlayer().MoveTo(playerMarker)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
Actor Property llavados auto
Actor Property memory auto
Actor Property numinar auto
ObjectReference Property playerMarker auto
ObjectReference Property numinarMarker auto
ObjectReference Property llavadosAccelerator auto
ObjectReference Property myDoor auto
GlobalVariable Property usedVariable auto
ObjectReference Property failmarker auto