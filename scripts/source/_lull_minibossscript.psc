Scriptname _Lull_MinibossScript extends ObjectReference  
MusicType Property minibossMusic auto
bool doOnce = false

Event OnTriggerEnter(ObjectReference akActionRef)
	if(!doOnce)
		minibossMusic.Add()
		doOnce = true
	endif
EndEvent
