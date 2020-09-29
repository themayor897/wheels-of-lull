Scriptname _Lull_HarquebusScript extends ObjectReference  

Ammo Property lullAmmo auto
GlobalVariable Property harqueBusequipped auto

Event OnEquipped(Actor akActor)
	Game.GetPlayer().AddItem(lullAmmo, 10)
	Game.GetPlayer().EquipItem(lullAmmo)
	RegisterForSingleUpdate(0.5)
	harqueBusequipped.setValue(1)
EndEvent


Event OnUnequipped(Actor akActor)
	Game.GetPlayer().RemoveItem(lullAmmo, 10)
	harqueBusequipped.setValue(0)
	UnregisterForUpdate()
EndEvent

Event OnUpdate()
	if(harqueBusequipped.getValue() == 1)
		if(Game.GetPlayer().GetItemCount(lullAmmo) <= 0)
			Game.GetPlayer().AddItem(lullAmmo, 10)
			Game.GetPlayer().EquipItem(lullAmmo, 10)
		endif
		RegisterForSingleUpdate(0.5)
	endif
EndEvent