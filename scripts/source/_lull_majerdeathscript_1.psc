Scriptname _Lull_MajerDeathScript_1 extends ObjectReference  

ObjectReference Property Majer1 auto
ObjectReference Property Majer2 auto

Event OnDeath(Actor akKiller)
	Majer1.EnableNoWait()
	Majer2.EnableNoWait()
	DisableNoWait()
	DeleteWhenAble()
endEvent