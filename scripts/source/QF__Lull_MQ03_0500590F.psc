;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 14
Scriptname QF__Lull_MQ03_0500590F Extends Quest Hidden

;BEGIN ALIAS PROPERTY _MQ03_Butter5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ03_Butter5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY _MQ03_Butter6
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ03_Butter6 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY _MQ03_SupplyContainer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ03_SupplyContainer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY _MQ03_JournalMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ03_JournalMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY _MQ03_Journal
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ03_Journal Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY _MQ03_Butter3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ03_Butter3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY _MQ03_Numinar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ03_Numinar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY _MQ03l_GuardM
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ03l_GuardM Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY _MQ03_KeyMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ03_KeyMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY _MQ03_Llavados
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ03_Llavados Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY _MQ03_Butter4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ03_Butter4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY _MQ03_Secarius
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ03_Secarius Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY _MQ03_Avarri
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ03_Avarri Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY _MQ03_Butter2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ03_Butter2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY _MQ03_Archeron
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ03_Archeron Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY _MQ03_Butter1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ03_Butter1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY _MQ03_ForgedNote
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ03_ForgedNote Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY _MQ03_Key
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ03_Key Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY _MQ03_GuardF
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ03_GuardF Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY _MQ03_Subori
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ03_Subori Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY _MQ03_Robes
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ03_Robes Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
Archeron.EvaluatePackage()
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

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;Set when Subori accepts the player's help 

SetObjectiveCompleted(5)
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;set when Archeron leaves player to their thoughts in jail cell

SetObjectiveFailed(25)
Archeron.EvaluatePackage()
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

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
;set when Numinar asks player to follow him outside

GuardFREF.MoveTo(guardFLocation)
AvarriREF.MoveTo(avarriMLocation)
LlavadosREF.MoveTo(llavLocation)
SuboriREF.MoveTo(suboriLocation)
NuminarREF.EvaluatePackage()
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
