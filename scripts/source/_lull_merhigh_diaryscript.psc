Scriptname _lull_MerHigh_DiaryScript extends ReferenceAlias  

Quest Property mq03 auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
  if akNewContainer == Game.GetPlayer()
		mq03.SetObjectiveCompleted(55)
		WoL.Log(GetRef(), "Player picked up Archeron's Diary")
		if mq03.IsObjectiveCompleted(49)
			mq03.SetObjectiveDisplayed(60)
			mq03.SetStage(60)
		endIf
  endIf
endEvent