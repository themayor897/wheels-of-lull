;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 13
Scriptname QF__Lull_MQ02_0500590E Extends Quest Hidden

;BEGIN ALIAS PROPERTY _MQ02_HighHrothgar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ02_HighHrothgar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY _MQ02_College
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ02_College Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY _MQ02_Numinar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ02_Numinar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY _MQ02_NuminarDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ02_NuminarDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY _MQ02_LlavadosTalker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ02_LlavadosTalker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY _MQ02_Thalmor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ02_Thalmor Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
quest1.SetObjectiveCompleted(20)
quest1.CompleteQuest()
quest1.Stop()
Game.GetPlayer().RemoveItem(llavPneuma, 1)
SetObjectiveDisplayed(5)
numinarDoor.lock(false)
llavados.MoveToMyEditorLocation()
llavados.Resurrect()
Utility.Wait(2)
llavados.Resurrect()
llavados.UnequipItem(llavadosMask)
Utility.Wait(2)
llavados.EquipItem(llavadosMask)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
Alias__MQ02_College.trytoenable()
Alias__MQ02_Thalmor.trytoenable()
Alias__MQ02_HighHrothgar.trytoenable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
_Lull_MQ02_LlavadosSaysGoodbye.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
;set at end of numinar's initial dialogue

NuminarREF.setdontmove(false)
NuminarREF.evaluatepackage()
Barrier.disablenowait()
Game.EnablePlayerControls()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property quest1 auto
MiscObject Property llavPneuma auto
Actor Property llavados auto
Armor Property llavadosMask auto

Scene Property _Lull_MQ02_LlavadosSaysGoodbye  Auto  

ObjectReference Property numinarDoor  Auto  

Actor Property NuminarREF  Auto  

ObjectReference Property Barrier  Auto  
