;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__0403E17F Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
GetOwningQuest().SetStage(10)
thalmorMarker.EnableNoWait()
Game.GetPlayer().MoveTo(lullMarker)
llavados.EquipItem(accelerator, 1)
llavados.AddItem(dwarvenArrow, 100)
subori.MoveTo(suboriMarker)
hammar.MoveTo(hammarMarker)
fyr.MoveTo(fyrMarker)
avarri.MoveTo(avarriMarker) 
yagrum.MoveTo(yagrumMarker) 
numinar.MoveTo(numinarMarker)
numinarDoor.SetLockLevel(255)
numinarDoor.Lock(true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
ObjectReference Property lullMarker auto
ObjectReference Property thalmorMarker auto
Actor Property llavados auto
Weapon Property accelerator auto
Ammo Property dwarvenArrow auto

ObjectReference Property suboriMarker auto
ObjectReference Property hammarMarker auto
ObjectReference Property fyrMarker auto
ObjectReference Property avarriMarker auto
ObjectReference Property yagrumMarker auto
ObjectReference Property numinarMarker auto
ObjectReference Property numinarDoor auto
Actor Property subori auto
Actor Property hammar auto
Actor Property fyr auto
Actor Property avarri auto
Actor Property yagrum auto
Actor Property numinar auto
