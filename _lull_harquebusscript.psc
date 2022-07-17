Scriptname _Lull_HarquebusScript extends ObjectReference  

Ammo Property lullAmmo auto
GlobalVariable Property harqueBusequipped auto
actor property playerRef auto 
Event OnEquipped(Actor akActor)
    playerRef.AddItem(lullAmmo, 10)
    playerRef.EquipItem(lullAmmo)
    RegisterForSingleUpdate(0.5)
    harqueBusequipped.setValue(1)
EndEvent


Event OnUnequipped(Actor akActor)
    playerRef.RemoveItem(lullAmmo, 10)
    harqueBusequipped.setValue(0)
    UnregisterForUpdate()
EndEvent

Event OnUpdate()
    if(harqueBusequipped.getValue() == 1)
        if(playerRef.GetItemCount(lullAmmo) <= 0)
            playerRef.AddItem(lullAmmo, 10)
           playerRef.EquipItem(lullAmmo, 10)
        endif
        RegisterForSingleUpdate(0.5)
    endif
EndEvent