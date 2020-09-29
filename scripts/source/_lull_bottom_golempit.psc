Scriptname _Lull_Bottom_GolemPit extends ObjectReference  

ObjectReference Property lullGolem auto
Sound Property lullScream auto
ObjectReference Property finalDoor auto

Event OnTriggerEnter(ObjectReference akActionRef)
	if(akActionRef == lullGolem)
		lullGolem.DisableNoWait()
		lullScream.Play(Game.GetPlayer())
		finalDoor.Lock(false)
	endif
EndEvent