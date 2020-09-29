Scriptname _Lull_Boiling_WhistlingKingFight extends ObjectReference  

ObjectReference Property whistlingKing auto
ObjectReference Property markerToMove auto
ObjectReference Property doorToLock1 auto
ObjectReference Property doorToLock2 auto

Sound Property chainReleaseSound auto
bool doOnce = false

Event OnTriggerEnter(ObjectReference akActionRef)
	if(!doOnce)
		doorToLock1.Lock(true)
		doorToLock2.Lock(true)
		doorToLock1.SetLockLevel(255)
		doorToLock2.SetLockLevel(255)
		Game.DisablePlayerControls()
		chainReleaseSound.Play(Game.GetPlayer())
		whistlingKing.TranslateToRef(markerToMove, 200)
		doOnce = true
	endif
EndEvent