;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__04019E5C Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
if (PlayerRef.GetItemCount(hammer)<1)
playerRef.AddItem(hammer, 1)
endif
if playerRef.GetItemCount(peg) <1
playerRef.additem(peg,3)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
Weapon Property hammer auto
Actor Property PlayerRef  Auto  

MiscObject Property peg  Auto  
