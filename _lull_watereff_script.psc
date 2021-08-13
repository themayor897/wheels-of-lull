scriptName _Lull_WaterEFF_Script extends activemagiceffect

Bool property isPotion auto
spell property spellToRemove auto
potion property potionToAdd auto
miscobject property itemToAdd auto
miscobject property itemToRemove auto
actor property playerRef auto

Event OnEffectStart(Actor akTarget, Actor akCaster)

    if !isPotion
        playerRef.AddItem(itemToAdd as form, 1, false)
    else
        playerRef.AddItem(potionToAdd as form, 1, false)
    endIf
    playerRef.RemoveItem(itemToRemove as form, 1, false, none)
    playerRef.RemoveSpell(spellToRemove)
endEvent
