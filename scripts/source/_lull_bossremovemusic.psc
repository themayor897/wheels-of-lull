Scriptname _Lull_BossRemoveMusic extends ObjectReference  

MusicType Property bossMusic auto
ObjectReference Property doorToUnlock1 auto
ObjectReference Property doorToUnlock2 auto

Event OnDeath(Actor akKiller)
	doorToUnlock1.Lock(false)
	doorToUnlock2.Lock(false)
	bossMusic.Remove()
endEvent