Scriptname _Lull_Boiling_getbit extends ObjectReference  

Quest Property MQ04 auto

Event OnActivate(ObjectReference akActivator) 
	MQ04.SetStage(30)
	MQ04.SetObjectiveDisplayed(30)
	MQ04.SetObjectiveCompleted(20)
EndEvent