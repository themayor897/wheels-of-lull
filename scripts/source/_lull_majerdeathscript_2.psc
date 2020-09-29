Scriptname _Lull_MajerDeathScript_2 extends ObjectReference  

ActorBase Property smallPeople auto
Sound Property deathSoundFinal  auto
ObjectReference Property barrier auto
MusicType Property bossMusic auto

Event OnDeath(Actor akKiller)
	if(smallPeople.GetDeadCount() >= 16)
		barrier.DisableNoWait()
		Game.ShakeCamera()
		deathSoundfinal.Play(Game.GetPlayer())
		bossMusic.Remove()
	endif
	DisableNoWait()
	DeleteWhenAble()
EndEvent