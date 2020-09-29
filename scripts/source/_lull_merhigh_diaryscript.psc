Scriptname _lull_MerHigh_DiaryScript extends ObjectReference  

Quest Property mq03 auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
  if akNewContainer == Game.GetPlayer()
		mq03.SetObjectiveCompleted(50)
		mq03.SetObjectiveCompleted(49)
		mq03.SetObjectiveDisplayed(60)
		mq03.SetStage(60)
  endIf
endEvent