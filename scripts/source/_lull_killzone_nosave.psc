Scriptname _Lull_Killzone_NoSave extends ObjectReference  

Event OnTriggerEnter(ObjectReference akActionRef)
	if(akActionRef == Game.GetPlayer())
		Game.GetPlayer().Kill()
	endif
EndEvent