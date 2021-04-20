Scriptname _Lull_BossRemoveMusic extends ObjectReference  

Quest Property MQ04 Auto

Event OnDeath(Actor akKiller)
	MQ04.SetStage(27)
endEvent
