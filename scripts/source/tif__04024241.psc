;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__04024241 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Numinar.RemoveItem(robes, 1, false, PlayerRef)
Numinar.RemoveItem(notes, 1, false, PlayerRef)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
Armor Property robes auto
Book Property notes auto
Actor Property numinar  Auto  

Actor Property PlayerRef  Auto  
