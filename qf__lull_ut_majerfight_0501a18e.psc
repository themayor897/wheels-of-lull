;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 17
Scriptname QF__Lull_UT_MajerFight_0501A18E Extends Quest Hidden

;BEGIN ALIAS PROPERTY SmallMajer12
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SmallMajer12 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SmallMajer4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SmallMajer4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SmallMajer3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SmallMajer3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SmallMajer1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SmallMajer1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SmallMajer9
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SmallMajer9 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SmallMajer10
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SmallMajer10 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SmallMajer5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SmallMajer5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SmallMajer16
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SmallMajer16 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SmallMajer2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SmallMajer2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SmallMajer13
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SmallMajer13 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SmallMajer6
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SmallMajer6 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SmallMajer15
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SmallMajer15 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SmallMajer11
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SmallMajer11 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SmallMajer14
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SmallMajer14 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SmallMajer7
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SmallMajer7 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SmallMajer8
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SmallMajer8 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
barrier.DisableNoWait()
Game.ShakeCamera()
spookSound.Play(playerRef)
bossMusic.Remove()
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
spookSound.Play(playerRef)
Game.DisablePlayerControls()
Game.ShakeCamera()
Miner1.EnableNoWait(1)
Utility.Wait(2)
Miner2.EnableNoWait(1)
Utility.Wait(2)
Miner3.EnableNoWait(1)
Utility.Wait(2)
Miner1.DisableNoWait()
Miner2.DisableNoWait()
Miner3.DisableNoWait()
Game.ShakeCamera()
spookSound2.Play(playerRef)
Majer1.EnableNoWait(1)
bossMusic.Add()
Game.EnablePlayerControls()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property Miner1 auto
ObjectReference Property Miner2 auto
ObjectReference Property Miner3 auto
MusicType Property bossMusic auto
bool doOnce = false
Sound Property spookSound auto
Sound Property spookSound2 auto 

ObjectReference Property Majer1  Auto  

ObjectReference Property barrier auto

Actor Property PlayerRef  Auto  
