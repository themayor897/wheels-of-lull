Scriptname _Lull_MQ06_EnableLight extends ObjectReference  
ObjectReference Property lighttrigger auto
ObjectReference Property ballTriggers1 auto
ObjectReference Property ballTriggers2 auto
ObjectReference Property memory auto
Sound Property appearSound auto
bool doOnce = false
Event OnTriggerEnter(ObjectReference akActionRef)
	if(!doOnce)
		if(akActionRef == memory)
			lighttrigger.EnableNoWait()
			ballTriggers1.EnableNoWait(1)
			ballTriggers2.EnableNoWait(1)
			appearSound.Play(Game.GetPlayer())
			doOnce = true
		endif
	endif
EndEvent