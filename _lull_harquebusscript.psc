Scriptname _Lull_HarquebusScript extends ObjectReference  
spell property reloadSpell auto
;Ammo Property lullAmmo auto
;GlobalVariable Property harqueBusequipped auto
;actor property playerRef auto 
Event OnEquipped(Actor akActor)
    ;  if akActor==playerRef
        ;playerRef.AddItem(lullAmmo, 10)
        ;  playerRef.EquipItem(lullAmmo)
        ;  RegisterForSingleUpdate(0.5)
        ; harqueBusequipped.setValue(1)
        akActor.addSpell(reloadSpell)
        ;endif 
EndEvent


Event OnUnequipped(Actor akActor)
    akActor.removeSpell(reloadSpell)
    ;playerRef.RemoveItem(lullAmmo, 10)
    ;  harqueBusequipped.setValue(0)
    ;   UnregisterForUpdate()
    EndEvent

;Event OnUpdate()
   ; if(harqueBusequipped.getValue() == 1)
        ;     if(playerRef.GetItemCount(lullAmmo) <= 0)
        ;      playerRef.AddItem(lullAmmo, 10)
        ;     playerRef.EquipItem(lullAmmo, 10)
        ;   endif
        ;  RegisterForSingleUpdate(0.5)
        ;  endif
        ;EndEvent