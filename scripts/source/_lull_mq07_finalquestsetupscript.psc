Scriptname _Lull_MQ07_FinalQuestSetupScript extends ObjectReference  

ObjectReference Property numinarMarker auto
Actor Property numinar auto
Actor Property Guard1 auto
Actor Property Guard2 auto
bool doOnce = false
Quest Property mq07 auto
Event OnTriggerEnter(ObjectReference akActionRef)
	if(!doOnce)
		numinar.MoveTo(numinarMarker)
		numinar.EnableNoWait()
		Guard1.EnableNoWait()
		Guard2.EnableNoWait()
		mq07.SetStage(4)
		doOnce = true
	endif
EndEvent