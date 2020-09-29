;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname TIF__044DF4B7 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
quest1.SetObjectiveCompleted(20)
quest1.CompleteQuest()
Game.GetPlayer().RemoveItem(llavPneuma, 1)
GetOwningQuest().SetStage(5)
GetOwningQuest().SetObjectiveDisplayed(5)
akSpeaker.DisableNoWait()
llavados.MoveToMyEditorLocation()
llavados.Resurrect()
Utility.Wait(2)
llavados.Resurrect()
llavados.UnequipItem(llavadosMask)
Utility.Wait(2)
llavados.EquipItem(llavadosMask)
llavados.GetActorBase().SetEssential(True)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
Quest Property quest1 auto
MiscObject Property llavPneuma auto
Actor Property llavados auto
Armor Property llavadosMask auto
