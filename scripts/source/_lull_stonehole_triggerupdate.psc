Scriptname _Lull_Stonehole_TriggerUpdate extends ObjectReference  

Quest Property lullMQ03 auto
bool doOnce = false

Event OnTriggerEnter(ObjectReference akActionRef)
	if(!doOnce)
		lullMQ03.SetStage(20)
		lullMQ03.SetObjectiveCompleted(15)
		lullMQ03.SetObjectiveDisplayed(20)
		doOnce = true
	endif
EndEvent