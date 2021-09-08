;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 48
Scriptname QF__Lull_MQ03_0500590F Extends Quest Hidden

;BEGIN ALIAS PROPERTY _MQ03_JournalMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ03_JournalMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY _MQ03_Archeron
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ03_Archeron Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY _MQ03_Key
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ03_Key Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY _MQ03_KeyMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ03_KeyMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY _MQ03_Llavados
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ03_Llavados Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY _MQ03_Subori
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ03_Subori Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY _MQ03_Avarri
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ03_Avarri Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY _MQ03_Secarius
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ03_Secarius Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY _MQ03_Numinar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ03_Numinar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY _MQ03_Butter3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ03_Butter3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY _MQ03_Butter2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ03_Butter2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY _MQ03l_GuardM
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ03l_GuardM Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY _MQ03_Butter4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ03_Butter4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY _MQ03_Butter1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ03_Butter1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY _MQ03_Butter5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ03_Butter5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY _MQ03_Butter6
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ03_Butter6 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY _MQ03_GuardF
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ03_GuardF Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY _MQ03_ForgedNote
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ03_ForgedNote Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY _MQ03_SupplyContainer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ03_SupplyContainer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY _MQ03_Robes
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ03_Robes Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY _MQ03_Journal
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ03_Journal Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;set when Archeron leaves player to their thoughts in jail cell

SetObjectiveFailed(25)
Archeron.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_36
Function Fragment_36()
;BEGIN CODE
archeron.DisableNoWait()
masscroft.DisableNoWait()
lullWall.DisableNoWait()
lullWall2.EnableNoWait()
lullWall3.EnableNoWait()
llavadosREF.MoveTo(hisMarker)
llavadosREF.PlaceAtMe(teleportFX as form)
llavadosREF.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Stage set in ExplainUpgate topic

SetObjectiveDisplayed(5)
doorGate.Lock(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_42
Function Fragment_42()
;BEGIN CODE
;set after Numinar's speech

MQ04.setstage(5)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;Set when Subori accepts the player's help 

SetObjectiveCompleted(5)
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
;Set after Secarius tells player about archeron. "A few lobotomies..."
;Exists for package and dialogue conditioning. Secarius is traveling to final marker near archeron.

SecariusREF.evaluatepackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_46
Function Fragment_46()
;BEGIN CODE
;waiting for player to meet quest conditions
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
;set when Numinar asks player to follow him outside

GuardFREF.MoveTo(guardFLocation)
AvarriREF.MoveTo(avarriMLocation)
LlavadosREF.MoveTo(llavLocation)
SuboriREF.MoveTo(suboriLocation)
NuminarREF.EvaluatePackage()

if (NuminarREF.GetCurrentPackage() != NumTravel)
WoL.Log(self, "Numinar package not running! MQ03 stage set to " + (GetStage() as Int) + ", attempting fix...", 2)
NuminarREF.EvaluatePackage()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_40
Function Fragment_40()
;BEGIN CODE
;stage set after picking up both key and journal ref aliases
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
;set in butter script attached to this quest. includes objective completion and display.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
;Set in Secarius travel to first marker package
;Exists for dialogue and package conditions. Secarius traveling to second marker.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_37
Function Fragment_37()
;BEGIN CODE
;Set when llavados teleports out of jail

SetObjectiveDisplayed(49)
SetObjectiveDisplayed(55)
PlayerRef.AddItem(visor, 1)
LlavadosREF.MoveToMyEditorLocation()
lullWall.EnableNoWait()
lullWall2.DisableNoWait()
lullwall3.DisableNoWait()
CellTear.EnableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
;set at the end of archeron/secarius intro scene
;exists for dialogue and package conditioning. 
;Archeron approaches player and talks to them for the fist time
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Set when player gives Secarius letter

masscroft.evaluatepackage()
PlayerRef.RemoveItem(orders)
Gate.activate(PlayerRef)
SetObjectiveCompleted(20)
SetObjectiveDisplayed(25)
SecariusREF.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN CODE
;set at the end of Archeron's first conversation with the player.
;exists for dialogue and package conditioning.
;Player is exploring whitehorn to find evidence.

Archeron.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;set at the end of ArcheronApproachCellPackage


Archeron.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
;Set at the end of Secarius travel to third script
;Exists for dialogue conditions

introScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
;setstage trigger in Whitehorn01


SetObjectiveCompleted(15)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN CODE
;set with _Lull_MerHigh_Trapped trigger in Whitehorn04
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Actor Property Masscroft  Auto  
Actor Property archeron  Auto  
Actor Property SecariusREF  Auto 
Actor Property PlayerRef Auto

Actor Property GuardFREF auto
Actor Property AvarriREF auto
Actor Property LlavadosREF auto
Actor Property SuboriREF auto
Actor Property NuminarREF auto

Book Property orders auto

ObjectReference Property doorGate  Auto  
ObjectReference Property Gate  Auto  

ObjectReference Property guardFLocation auto
ObjectReference Property avarriMLocation auto
ObjectReference Property llavLocation auto
ObjectReference Property suboriLocation auto

Scene Property introScene auto 


objectreference property hisMarker auto
objectreference property lullWall auto
objectreference property lullWall2 auto
objectreference property lullWall3 auto

activator property teleportFX auto

Armor Property visor auto 

Quest Property MQ04 auto 

Package Property NumTravel auto 

ObjectReference Property CellTear  Auto  
