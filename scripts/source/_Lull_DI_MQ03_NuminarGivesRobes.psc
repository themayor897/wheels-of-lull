;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname _Lull_DI_MQ03_NuminarGivesRobes Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
chest.RemoveItem(robes, 1, false, PlayerRef)
chest.RemoveItem(notes, 1, false, PlayerRef)
RobesAdded.Show()
ITMClothingUp.Play(PlayerRef)
NotesAdded.Show()
ITMNoteUp.Play(PlayerRef)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
Armor Property robes auto
Book Property notes auto
ObjectReference Property chest Auto  

Actor Property PlayerRef  Auto  

Sound Property ITMClothingUp  Auto  

Sound Property ITMNoteUp  Auto  

Message Property RobesAdded  Auto  

Message Property NotesAdded  Auto  
