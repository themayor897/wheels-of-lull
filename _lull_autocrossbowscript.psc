Scriptname _lull_autocrossbowScript extends ObjectReference  

spell property crossbowSpell auto

; Fix idea from RolandSir
Perk Property QuickshotPerk auto
Int PlayerHasPerk = 0
actor property playerRef auto

Event OnEquipped(Actor akActor)
    akActor.addSpell(crossbowSpell,false)
    
    if (akActor == playerRef && playerRef.HasPerk(QuickshotPerk))
        PlayerHasPerk = 1
        playerRef.RemovePerk(QuickshotPerk)
    endif
endEvent

Event OnUnequipped(Actor akActor)
    akActor.removeSpell(crossbowSpell)
    
    if (akActor == playerRef && PlayerHasPerk == 1)
        PlayerHasPerk = 0
        playerRef.AddPerk(QuickshotPerk)
    endif
endEvent