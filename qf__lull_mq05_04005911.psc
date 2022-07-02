;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 21
Scriptname QF__Lull_MQ05_04005911 Extends Quest Hidden

;BEGIN ALIAS PROPERTY _MQ04_Numinar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ04_Numinar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY _MQ04_Fyr
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ04_Fyr Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY _MQ04_Yagrum
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias__MQ04_Yagrum Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Set via "Deal with it" dialogue

SetObjectiveDisplayed(10)
SetObjectiveDisplayed(12)
DrillParent01.DisableNoWait(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
;Set in "Your friend is a Dwarf?"

Utility.Wait(2)
YagrumRef.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;started via Old Tho Mahalis Script on Death
NuminarREF.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
;Set at end of FyrSaboteur Scene

SetObjectiveCompleted(10)
SetObjectiveCompleted(12)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
;player enters Old Tho trigger

game.disablePlayerControls()
thoSummon.Play(PlayerRef)
tho1.EnableNoWait(1)
Utility.Wait(2)
thoCast.Cast(tho1, tho2)
thoCast.Cast(tho1, tho3)
thoCast.Cast(tho1, tho4)
thoCast.Cast(tho1, tho5)
Utility.Wait(2)
tho1.DisableNoWait(1)
tho2.DisableNoWait(1)
tho3.DisableNoWait(1)
tho4.DisableNoWait(1)
tho5.DisableNoWait(1)
thoAlive.Play(Game.GetPlayer())
thoBoss.EnableNoWait()
ThoMusic.Add()
Game.EnablePlayerControls()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
;Started in "What are you doing in catacombs"

FyrScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Set when the player asks who Fyr is

FyrREF.EnableNoWait()
YagrumREF.EnableNoWait()
FyrREF.MoveTo(MQ05_FyrMarker)
YagrumREF.MoveTo(MQ05_YagrumMarker)
Utility.Wait(2)
FyrREF.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
;Set in SaboteurWho Topic

SetObjectiveDisplayed(21)
NuminarREF.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;Set in "Weren't you a bloated monster?"

Utility.Wait(2)
FyrRef.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
_Lull_WorldShift02.Show()
numinarREF.moveto(PlayerRef)
numinarREF.PlaceAtMe(TeleportMarker)
numinarREF.enable()
numinarREF.evaluatepackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Set in "You, come with me, now"
 objectReference animal = currentAnimal.getReference()
ObjectReference follower = currentfollower.getReference()
numinarREF.MoveTo(numinarcontrolMarker)
    if animal 
        animal.MoveTo(animalMarker)
    endif 
    if follower
        follower.moveTo(followerMarker)
    endif 
PlayerREF.MoveTo(playercontrolMarker)
numinarRef.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Set in quest end topic

SetObjectiveCompleted(21)
;minerMarker.EnableNoWait() not used??
DrillParent02.DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Actor Property numinarREF auto
Activator Property TeleportMarker auto

Message Property _Lull_WorldShift02  Auto  

ObjectReference Property numinarcontrolMarker auto
ObjectReference Property playercontrolMarker auto

ObjectReference Property DrillParent01  Auto  

Actor Property PlayerRef Auto

ObjectReference Property DrillParent02 Auto

Actor Property FyrREF Auto
Actor Property YagrumREF Auto
ObjectReference Property MQ05_FyrMarker Auto
ObjectReference Property MQ05_YagrumMarker Auto 
Scene Property FyrScene  Auto  

;-------------------------

MusicType Property ThoMusic auto
ObjectReference Property tho1 auto
ObjectReference Property tho2 auto
ObjectReference Property tho3 auto
ObjectReference Property tho4 auto
ObjectReference Property tho5 auto
ObjectReference Property thoBoss auto
Sound Property thoSummon auto
Spell Property thoCast auto
Sound Property thoAlive auto

ReferenceAlias property currentFollower Auto
ReferenceAlias property currentAnimal auto 
ObjectReference Property followerMarker auto
ObjectReference Property animalMarker auto  
