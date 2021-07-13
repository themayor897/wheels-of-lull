;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 10
Scriptname QF__Lull_MQ07_05005913 Extends Quest Hidden

;BEGIN ALIAS PROPERTY MQ07_Archeron
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MQ07_Archeron Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MQ07_ArcheronTA
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MQ07_ArcheronTA Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;Talked to Numinar, Archeron behind me.
Numinar.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Player fighting RAMON. Set in Archeron final boss script.

;From Old Archeron Final Boss Script
PlayerRef.MoveTo(moveToRamon)
blackout.remove()
;archeronFight.Remove()
;movetoramon.say(ArcheronFinal, archeron, true)
;AllTheStops.Start()
archeron.DisableNoWait()
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

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
blackout.apply()
collapse.play(PlayerRef)
Utility.Wait(1)
ObjectReference ArchSay = PlayerRef.PlaceAtMe(xMarkerActivator)
ArchSay.Say(ArcheronFinal, Archeron, True)
collapse.play(PlayerRef)
Utility.Wait(4)
Setstage(9)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Conditioned in: MQ07_ForceGreet Package, set via Hammar's MQ07 dialogue.
SetObjectiveDisplayed(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Hammar Dialogue conditioned
;First stage, set in MQ06 stage 40
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;Moved from RamonHeadScript, where this stage is now set.

llavados.MoveTo(llavadosMarker)
llavados.EnableNoWait()
memory.MoveTo(memoMarker)
memory.EnableNoWait()
PlayerRef.MoveTo(endMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;set when Llavados says goodbye

if(usedVariable.GetValue() >= 1)
 PlayerRef.MoveTo(failmarker)
else
 PlayerRef.MoveTo(playerMarker)
endif
llavados.DisableNoWait()
memory.DisableNoWait()
llavadosAccelerator.EnableNoWait()
myDoor.lock(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;setstage trigger in LullCave09
;About to enter/entering Snow-Throat Cell
;Numinar dialogue

numinar.MoveTo(MQ07_NuminarTPMarker)
numinar.EnableNoWait()
GuardMREF.EnableNoWait()
GuardFREF.EnableNoWait()
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
;ObjectReference Property ramonSkullMarker2 auto
;ObjectReference Property ramonSkullMarker3 auto

;Left hand markers
ObjectReference Property ramonHandLMarker1 auto
;ObjectReference Property ramonHandLMarker2 auto
;ObjectReference Property ramonHandLMarker3 auto

;Right hand markers
ObjectReference Property ramonHandRMarker1 auto
;ObjectReference Property ramonHandRMarker2 auto
;ObjectReference Property ramonHandRMarker3 auto

;Speaker
Actor Property numinar auto
ObjectReference Property numinarMarker auto

Scene Property AllTheStops  Auto  

Actor Property archeron  Auto  

Topic Property ArcheronFinal  Auto  

ImageSpaceModifier Property blackOut  Auto  

Activator Property xMarkerActivator  Auto  

Sound Property Collapse  Auto

Actor Property llavados auto
Actor Property memory auto
ObjectReference Property playerMarker auto
ObjectReference Property llavadosAccelerator auto
ObjectReference Property myDoor auto
GlobalVariable Property usedVariable auto
ObjectReference Property failmarker auto

Actor Property GuardMREF auto
Actor Property GuardFREF auto
ObjectReference Property MQ07_NuminarTPMarker auto

ObjectReference Property MemoMarker auto
ObjectReference Property LlavadosMarker auto
ObjectReference Property EndMarker auto

Actor Property PlayerRef auto 
