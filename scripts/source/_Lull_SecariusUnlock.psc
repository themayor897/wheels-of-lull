Scriptname _Lull_SecariusUnlock extends ObjectReference  

Actor Property Secarius auto
ObjectReference Property FrontDoor auto
bool doorLocked = true

Event OnTriggerEnter(ObjectReference TriggerRef)
	
	if (TriggerRef == Secarius && doorLocked == true)
		FrontDoor.Lock(False, True)
		doorLocked = False
	endif

EndEvent 