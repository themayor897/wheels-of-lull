;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname QF__Lull_MQ07_05005913 Extends Quest Hidden

;BEGIN ALIAS PROPERTY archeron
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_archeron Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MQ07_ArcheronTA
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MQ07_ArcheronTA Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;From Old Archeron Final Boss Script
Game.GetPlayer().MoveTo(moveToRamon)
archeronFight.Remove()
Alias_archeron.TryToDisableNoWait()
;old ramon master script
numinar.MoveTo(numinarMarker)
Game.DisablePlayerControls()
Utility.Wait(2)
ramonSkull.EnableNoWait()
ramonHandL.EnableNoWait()
ramonHandR.EnableNoWait()
Game.ShakeCamera(Game.GetPlayer(), 0.75, 20)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MusicType Property archeronFight  Auto  

ObjectReference Property moveToRamon  Auto  

;Master things
ObjectReference Property ramonSkull auto
ObjectReference Property ramonHandL auto
ObjectReference Property ramonHandR auto
;Marker 1 is the initial fly to marker
;Skull movement markers
ObjectReference Property ramonSkullMarker1 auto
ObjectReference Property ramonSkullMarker2 auto
ObjectReference Property ramonSkullMarker3 auto

;Left hand markers
ObjectReference Property ramonHandLMarker1 auto
ObjectReference Property ramonHandLMarker2 auto
ObjectReference Property ramonHandLMarker3 auto

;Right hand markers
ObjectReference Property ramonHandRMarker1 auto
ObjectReference Property ramonHandRMarker2 auto
ObjectReference Property ramonHandRMarker3 auto

;Speaker
Actor Property numinar auto
ObjectReference Property numinarMarker auto
