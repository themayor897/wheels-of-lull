Scriptname _Lull_MQ06_ThalmorDeathScript extends ReferenceAlias  Conditional  

_Lull_MQ06_ThalmorUtility  LTU

Event OnDeath(Actor akKiller)
	
	WoL.Log(GetReference(), "Thalmor Dead")
	LTU= GetOwningQuest() as _Lull_MQ06_ThalmorUtility
	LTU.ThalmorCount()

EndEvent