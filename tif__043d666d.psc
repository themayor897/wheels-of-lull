;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__043D666D Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
PlayerRef.AddItem(staff1, 1)
PlayerRef.AddItem(staff2, 1)
PlayerRef.AddItem(staff3, 1)
PlayerRef.AddItem(staff4, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
Weapon Property staff1 auto
Weapon Property staff2 auto
Weapon Property staff3 auto
Weapon Property staff4 auto

Actor Property PlayerRef  Auto  
