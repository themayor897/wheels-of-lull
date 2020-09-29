Scriptname _Lull_MQ06_EndTriggerScript extends ObjectReference  
Quest Property MQ06 auto
Quest Property MQ07 auto
ObjectReference Property rockMarker auto
ObjectReference Property numinar auto
ObjectReference Property guard1 auto
ObjectReference Property guard2 auto
ObjectReference Property minerMarker auto
bool doOnce = false
Armor Property lullShield auto
Event OnTriggerEnter(ObjectReference akActionRef)
	if(Game.GetPlayer().GetItemCount(lullShield) >= 1)
		if(!doOnce)
			doOnce = true
			MQ06.SetStage(26)
			MQ06.SetObjectiveCompleted(20)
			MQ06.SetObjectiveCompleted(21)
			rockMarker.DisableNoWait()
			numinar.DisableNoWait()
			guard1.DisableNoWait()
			guard2.DisableNoWait()
			minerMarker.DisableNoWait()
			MQ07.SetStage(2)
			MQ07.SetObjectiveDisplayed(2)
			MQ06.CompleteQuest()
		endif
	endif
EndEvent