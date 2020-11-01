Scriptname _Lull_WhitehornTeleport extends ObjectReference  
{Teleports the player between passages in Whitehorn Dungeon.}

ObjectReference Property PlayerRef Auto

Sound Property TPSound Auto


Event OnTriggerEnter(ObjectReference akActionRef)

	If akActionRef == PlayerRef
		PlayerRef.moveto(self.GetLinkedRef())
		TPSound.Play(PlayerRef)
	EndIf

EndEvent
