Scriptname _Lull_MajerDeathScript_1 extends ObjectReference  

ActorBase Property newGhost1 auto

ObjectReference Property MajerSpawn auto

Event OnDeath(Actor akKiller)
	MajerSpawn.PlaceAtMe(newGhost1, 2)
	DisableNoWait()
	DeleteWhenAble()
endEvent