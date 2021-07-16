;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 40
Scriptname QF__Lull_MQ06_04005912 Extends Quest Hidden

;BEGIN ALIAS PROPERTY MQ06_Thalmor1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MQ06_Thalmor1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MQ06_Thalmor6
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MQ06_Thalmor6 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MQ06_Fyr
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MQ06_Fyr Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MQ06_Thalmor4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MQ06_Thalmor4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MQ06_Masscroft
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MQ06_Masscroft Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MQ06_Numinar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MQ06_Numinar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MQ06_Thalmor2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MQ06_Thalmor2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MQ06_Yagrum
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MQ06_Yagrum Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MQ06_Thalmor7
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MQ06_Thalmor7 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MQ06_Thalmor3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MQ06_Thalmor3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MQ06_Thalmor5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MQ06_Thalmor5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MQ06_Archeron
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MQ06_Archeron Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN CODE
;Game.GetPlayer().MoveTo(PlayerCellMarker)
bottomFact.SendPlayertoJail(abRemoveInventory=False) 
Fyr.MoveTo(FyrJail)
Yagrum.MoveTo(YagrumJail)
Fyr.EvaluatePackage()
Yagrum.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;set at the end of portal conversation "get in here you fool"
thalmorMarker.EnableNoWait()
Game.GetPlayer().MoveTo(lullMarker)
setobjectivedisplayed(10)
llavados.AddItem(accelerator, 1)
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
WorldShift03.show()
portal.moveto(PlayerRef)
lullTalkyActivator3.MoveTo(portal)
portal.playAnimation("playAnim02")
SetStage(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
;Setstage trigger in elevator room after quest is completed

SetObjectiveCompleted(24)
rockMarker.DisableNoWait()
numinar.DisableNoWait()
guard1.DisableNoWait()
guard2.DisableNoWait()
minerMarker.DisableNoWait()
MQ07.SetStage(1)
MQ07.SetObjectiveDisplayed(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
;set at end of fyr final dialogue
Fyr.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
setobjectivecompleted(14)
;Numinar appreaches player and arrests him
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_38
Function Fragment_38()
;BEGIN CODE
;Player enters trigger in front of elevator

Game.DisablePlayerControls()
doorClose.Play(grate)
grate.TranslateToRef(grateEnd, 600)
grate2.enablenowait()
Utility.Wait(3)
masscroft.MoveTo(xMarker)
massCroftAppear.Play(xMarker)
Utility.Wait(4)
masscroft.StartCombat(PlayerRef)
Game.EnablePlayerControls()
massBossMusic.Add()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN CODE
MemoryREF.DisableNoWait(1)
bottomGrate.DisableNoWait(1)
magicSound.Play(PlayerRef)
llavados.MoveTo(LlavadosMarker)
llavados.UnequipAll()
Utility.Wait(1)
llavados.EquipItem(lHelm)
llavados.EquipItem(lTorso)
llavados.EquipItem(lHands)
llavados.EquipItem(lFeet)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
SetObjectiveCompleted(10)
Fyr.EvaluatePackage()
Yagrum.EvaluatePackage()
Numinar.EvaluatePackage()
setobjectivedisplayed(14)
Masscroft.Enable()
Archeron.Enable()
Utility.Wait(20)
If GetStage() < 15
WoL.Log(self, "20 seconds have passed and Lull-Mor confer scene has not started. Forcing advance...")
Fyr.Moveto(FyrConfer)
Yagrum.MoveTo(YagrumConfer)
Numinar.MoveTo(NuminarConfer)
Endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
;set in FyrToCage package
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_31
Function Fragment_31()
;BEGIN CODE
;get up
setobjectivedisplayed(24)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN CODE
;end llavados conversation
SetObjectiveDisplayed(30)
mainDoor.Lock(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_34
Function Fragment_34()
;BEGIN CODE
Utility.Wait(2)
BreakSound.Play(PlayerRef)
;MetalCage.TranslateToRef(CageFallRef, 700)
;Utility.Wait(1)
MetalCage.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
;Conversation in Lull-Mor (scene)
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

ObjectReference Property NuminarConfer Auto
ObjectReference Property FyrConfer Auto
ObjectReference Property YagrumConfer Auto

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

Message Property WorldShift03 auto

ObjectReference Property FyrJail  Auto  

ObjectReference Property YagrumJail  Auto  

ObjectReference Property PlayerJailMarker  Auto  

Faction Property bottomFact  Auto  

Actor Property MemoryRef  Auto  

ObjectReference Property MainDoor  Auto  

ObjectReference Property BottomGrate  Auto  

ObjectReference Property llavadosMarker  Auto  

Sound Property magicSound  Auto  

Sound Property BreakSound  Auto  

ObjectReference Property MetalCage  Auto  

ObjectReference Property CageFallRef  Auto  

;------------------------------

Armor Property lHelm  Auto
Armor Property lTorso Auto
Armor Property lHands Auto
Armor Property lFeet Auto  
