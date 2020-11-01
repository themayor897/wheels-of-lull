Scriptname _Lull_MajerDeathScript_2 extends ReferenceAlias  Conditional

_Lull_MajerUtilityScript  LMU  


Event OnDeath(Actor akKiller)

	LMU= GetOwningQuest() as _Lull_MajerUtilityScript
	LMU.MajCount()
	TryToDisableNoWait()

EndEvent