Scriptname _Lull_MQ06_ShieldObjective extends ObjectReference  

Quest Property MQ06 Auto
ObjectReference Property PlayerRef Auto
Int Property BottomStage Auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if MQ06.GetStage() as Int == BottomStage
		if akNewContainer == PlayerRef
			MQ06.SetObjectiveCompleted(30)
		endif
	endif
EndEvent
