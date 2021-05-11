;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 18
Scriptname QF__Lull_MQ04_05005910 Extends Quest Hidden

;BEGIN ALIAS PROPERTY _MQ04_Numinar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ04_Numinar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY _MQ04_Drillbit
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ04_Drillbit Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;Whistling King OnTranslationComplete

RealWhistlingKing.MoveTo(WhistlingKing)
WhistlingKing.DisableNoWait()
bossMusic.Add()
Game.EnablePlayerControls()
whistlingKingAwakens.Play(PlayerRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Activated trigger around drillbit

WoL.Log(self, "Drillbit acquired, advancing stage and enabling black FRF")
PlayerRef.AddItem(drillBit, 1)
doorMarker1.DisableNoWait() 
blackFRF.EnableNoWait()
MinesStartup.setstage(5)
guardsActivate.EnableNoWait()
bittrigger.DisableNoWait()
SetObjectiveDisplayed(30)
SetObjectiveCompleted(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
;Welding Soldier Defeated

FrontDoor.SetLockLevel(0)
FrontDoor.Lock(False)
Soldier.DisableNoWait()
SoldierDie.Play(PlayerRef)
minibossMusic.Remove()
Ohm.EnableNoWait()
effectSpell.Cast(Ohm, Ohm)
Utility.Wait(1)
wallBall.DisableNoWait()
WoL.Log(self, "Welding Soldier defeated, Rod of Ohm enabled")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;player enters the foundry

SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
;OnDeath Whistling King

doorToLock1.Lock(false)
doorToLock2.Lock(false)
bossMusic.Remove()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
;Welding Soldier Start

FrontDoor.SetLockLevel(255)
FrontDoor.Lock()
minibossmusic.add()
Soldier.EnableNoWait()
MechNoise.Play(PlayerRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Player entered King fight room

doorToLock1.Lock(true)
doorToLock2.Lock(true)
doorToLock1.SetLockLevel(255)
doorToLock2.SetLockLevel(255)
Game.DisablePlayerControls()
chainReleaseSound.Play(PlayerRef)
whistlingKing.TranslateToRef(markerToMove, 200)
WoL.Log(self, "Whistling King fight commencing...")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property PlayerRef Auto

;--------

ObjectReference Property whistlingKing auto
ObjectReference Property markerToMove auto
ObjectReference Property doorToLock1 auto
ObjectReference Property doorToLock2 auto

Sound Property chainReleaseSound auto

;--------------------------------

MiscObject Property drillBit auto

Quest Property MinesStartup auto

ObjectReference Property doorMarker1 auto
ObjectReference Property guardsActivate auto
ObjectReference Property blackFRF auto
ObjectReference Property BitTrigger  Auto  

;--------------------------------------

Actor Property RealWhistlingKing auto
Sound Property whistlingKingAwakens auto
MusicType Property bossMusic auto

;---------------------------------------

MusicType Property minibossMusic auto
Actor Property Soldier auto
Sound Property MechNoise auto
ObjectReference Property Ohm Auto
Spell Property EffectSpell Auto
Sound Property SoldierDie Auto
ObjectReference Property WallBall Auto
ObjectReference Property FrontDoor Auto
