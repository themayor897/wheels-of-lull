;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 16
Scriptname QF__Lull_MQ06_04005912 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Location
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Location Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MQ06_Thalmor7
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MQ06_Thalmor7 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MQ06_Thalmor6
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MQ06_Thalmor6 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MQ06_Numinar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MQ06_Numinar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MQ06_Thalmor3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MQ06_Thalmor3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LocationCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LocationCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MQ06_Thalmor1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MQ06_Thalmor1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MQ06_Thalmor2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MQ06_Thalmor2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MQ06_Thalmor4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MQ06_Thalmor4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MQ06_Fyr
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MQ06_Fyr Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MQ06_Yagrum
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MQ06_Yagrum Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MQ06_Thalmor5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MQ06_Thalmor5 Auto
;END ALIAS PROPERTY

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

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
;Player enters trigger in front of elevator

Game.DisablePlayerControls()
doorClose.Play(grate)
grate.TranslateToRef(grateEnd, 600)
grate2.enablenowait()
Utility.Wait(3)
masscroft.MoveTo(xMarker)
massCroftAppear.Play(masscroft)
Utility.Wait(4)
masscroft.StartCombat(PlayerRef)
Game.EnablePlayerControls()
massBossMusic.Add()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
Fyr.EvaluatePackage()
Yagrum.EvaluatePackage()
Numinar.EvaluatePackage()
setobjectivedisplayed(14)
Masscroft.Enable()
Archeron.Enable()
;END CODE
EndFunction
;END FRAGMENT

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

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
;Setstage trigger in elevator room after quest is completed

SetObjectiveCompleted(20)
SetObjectiveCompleted(21)
rockMarker.DisableNoWait()
numinar.DisableNoWait()
guard1.DisableNoWait()
guard2.DisableNoWait()
minerMarker.DisableNoWait()
MQ07.SetStage(2)
MQ07.SetObjectiveDisplayed(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
thalmorMarker.DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property portal auto
ObjectReference Property lullTalkyActivator3 auto
Actor Property PlayerRef auto

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

Actor Property masscroft  Auto  

Actor Property archeron  Auto  

;-----------------------------

ObjectReference Property grate auto
ObjectReference Property grate2 auto
ObjectReference Property grateEnd auto
ObjectReference Property xMarker auto

Sound Property doorClose auto
Sound Property massCroftAppear auto
MusicType Property massBossMusic auto

;------------------------------

Quest Property MQ07 auto
ObjectReference Property rockMarker auto
ObjectReference Property guard1 auto
ObjectReference Property guard2 auto
ObjectReference Property minerMarker auto
