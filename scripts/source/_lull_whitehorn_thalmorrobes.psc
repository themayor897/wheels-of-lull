Scriptname _Lull_Whitehorn_ThalmorRobes extends ObjectReference  

Faction Property _lull_Thalmor auto

Event OnEquipped(Actor akActor)
	akActor.AddToFaction(_lull_Thalmor)
	_lull_Thalmor.SetPlayerEnemy(false)
endEvent

Event OnUnequipped(Actor akActor)
	akActor.RemoveFromFaction(_lull_Thalmor)
	_lull_Thalmor.SetPlayerEnemy(true)
endEvent
