;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 16
Scriptname QF__Lull_UT_Test_06065C25 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
MQ03.Setstage(5)
MQ03.Setstage(10)
MQ03.setstage(15)
MQ03.SetObjectiveCompleted(10)
MQ03.SetObjectiveDisplayed(15)
MQ03.SetStage(20)
MQ03.SetStage(25)
MQ03.SetStage(35)
MQ03.Setstage(40)
MQ03.Setstage(44)
MQ03.Setstage(45)
MQ03.Setstage(50)
MQ03.Setstage(51)
MQ03.Setstage(55)
MQ03.Setstage(60)
MQ03.Setstage(65)
MQ03.CompleteAllObjectives()
MQ03.Setstage(70)
PlayerRef.MoveTo(Marker03)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
MQ06.setstage(5)
MQ06.setstage(10)
thalmormarker.disablenowait()
MQ06.setstage(14)
MQ06.setstage(15)
MQ06.setstage(16)
MQ06.setstage(17)
MQ06.setstage(18)
FyrREF.disablenowait()
YagrumREF.disablenowait()
ArcheronREF.enablenowait()
MasscroftREF.enablenowait()
MQ06.setstage(19)
MQ06.setstage(20)
MQ06.setstage(21)
MQ06.setstage(22)
MQ06.setstage(40)
PlayerREF.MoveTo(Marker03)
PlayerREF.additem(shield, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
MQ05.setstage(5)
MQ05.setstage(10)
MQ05.setstage(15)
MQ05.setstage(16)
MQ05.setstage(17)
MQ05.setstage(18)
MQ05.setstage(20)
MQ05.setstage(21)
MQ05.setstage(22)
PlayerRef.AddItem(Unwinder, 1)
Utility.Wait(4)
MQ06.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
MQ01.Start()
_Lull_WorldShift01.Show()
LlavadosREF.MoveTo(PlayerRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
MQ02.SetStage(5)
MQ02.CompleteQuest()
PlayerRef.Moveto(marker03)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
MQ04.SetStage(10)
MQ04.SetStage(20)
MQ04.SetStage(30)
MQ04.SetStage(31)
MQ04.CompleteAllObjectives()
MQ04.CompleteQuest()
MQ04.Stop()
playerref.additem(ohm, 1)
playerref.removeitem(drillbit, 1)
Utility.Wait(4)
MQ05.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
MQ01.SetStage(10)
MQ01.SetStage(20)
PlayerRef.MoveTo(LullMorMarker)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MQ01 auto
Quest Property MQ02 auto
Quest Property MQ03 auto
Quest Property MQ04 auto
Quest Property MQ05 auto
Quest Property MQ06 auto
Quest Property MQ07 auto

Actor Property PlayerRef auto
Actor Property LlavadosREF auto
Actor Property NuminarREF auto 
Actor Property FyrREF auto
Actor Property YagrumREF auto
Actor Property MasscroftREF auto
Actor Property ArcheronREF auto

Message Property _Lull_WorldShift01 auto 

ObjectReference Property LullMorMarker auto 
ObjectReference Property Marker03 auto
ObjectReference Property ThalmorMarker auto

Weapon Property Ohm auto
Weapon Property Unwinder auto

Armor Property Shield auto

MiscObject Property drillbit auto 
