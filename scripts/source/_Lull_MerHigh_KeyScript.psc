Scriptname _Lull_MerHigh_KeyScript extends ReferenceAlias  

Quest Property mq03 auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
  if akNewContainer == Game.GetPlayer()
		mq03.SetObjectiveCompleted(49)
		WoL.Log(GetRef(), "Player picked up key to Whitehorn dungeons.")
		if mq03.IsObjectiveCompleted(55)
			mq03.SetObjectiveDisplayed(60)
			mq03.SetStage(60)
		endIf
  endIf
endEvent
