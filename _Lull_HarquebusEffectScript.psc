Scriptname _Lull_HarquebusEffectScript extends ActiveMagicEffect 

Ammo Property lullAmmo auto
actor EquippedActor
int maxAmmo = 10

EVENT OnEffectStart(Actor Target, Actor Caster)
    EquippedActor = target
    EquippedActor.AddItem(lullAmmo, maxAmmo, abSilent = true)
    EquippedActor.EquipItem(lullAmmo, abSilent = true)
    RegisterForSingleUpdate(0.5)
endEVENT

EVENT OnEffectFinish(Actor Target, Actor Caster)
      unregisterforupdate()
    EquippedActor.UnEquipItem(lullAmmo, abSilent = true)
    EquippedActor.RemoveItem(lullAmmo, maxAmmo, abSilent = true)
  
endEVENT


Event OnUpdate()
    int CurrentAmmo = EquippedActor.GetItemCount(lullAmmo)
    if CurrentAmmo < maxAmmo
        EquippedActor.AddItem(lullAmmo, maxAmmo - CurrentAmmo, abSilent = true)
    endif
    RegisterForSingleUpdate(0.5)
EndEvent