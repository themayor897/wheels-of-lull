Scriptname _Lull_Boiling_JournalScript extends ObjectReference  
Quest Property mq04 auto
bool doOnce = false

Event OnTriggerEnter(ObjectReference akActionRef)
	if(!doOnce)
		mq04.SetStage(20)
		mq04.SetObjectiveCompleted(10)
		mq04.SetObjectiveDisplayed(20)
		doOnce = true
	endif
EndEvent