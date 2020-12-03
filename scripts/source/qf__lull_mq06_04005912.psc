;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname QF__Lull_MQ06_04005912 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Location
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Location Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MQ06_Fyr
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MQ06_Fyr Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LocationCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LocationCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MQ06_Yagrum
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MQ06_Yagrum Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MQ06_Numinar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MQ06_Numinar Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
thalmorMarker.EnableNoWait()
Game.GetPlayer().MoveTo(lullMarker)
setobjectivedisplayed(10)
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
lullTalkyActivator3.disable()
portal.disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
portal.moveto(PlayerRef)
lullTalkyActivator3.MoveTo(portal)
portal.playAnimation("playAnim02")
SetStage(5)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property portal auto
ObjectReference Property lullTalkyActivator3 auto
ObjectReference Property PlayerRef auto

;-------------------------

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
