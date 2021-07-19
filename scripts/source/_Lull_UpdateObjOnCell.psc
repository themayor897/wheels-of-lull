Scriptname _Lull_UpdateObjOnCell extends ObjectReference  
{Updates quest objective on cell attach.
}

Quest Property myQuest Auto
Int Property myObjective Auto
Int Property ReqStageOPT = -1 Auto

Event OnCellAttach()

	If ReqStageOPT == -1 || myQuest.getStageDone(ReqStageOPT) == 1
		myQuest.SetObjectiveCompleted(myObjective)
	EndIf
	
EndEvent