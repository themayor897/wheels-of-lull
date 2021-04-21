Scriptname _Lull_MajerDeathScript_1 extends ObjectReference  

;Created by themayor897 for v5.0.0
;themayor897 added logging function 4.20.21

ObjectReference Property Majer1 auto
ObjectReference Property Majer2 auto

Event OnDeath(Actor akKiller)
	Majer1.EnableNoWait()
	Majer2.EnableNoWait()
	DisableNoWait()
	DeleteWhenAble()
	WoL.Log(self, "One Majer Dead, next two enabled.")
endEvent