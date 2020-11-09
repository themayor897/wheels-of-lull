scriptName _Lull_WaterEFF_Script extends activemagiceffect

Bool property isPotion auto
spell property spellToRemove auto
potion property potionToAdd auto
miscobject property itemToAdd auto
miscobject property itemToRemove auto


Event OnEffectStart(Actor akTarget, Actor akCaster)

	if !isPotion
		game.GetPlayer().AddItem(itemToAdd as form, 1, false)
	else
		game.GetPlayer().AddItem(potionToAdd as form, 1, false)
	endIf
	game.GetPlayer().RemoveItem(itemToRemove as form, 1, false, none)
	game.GetPlayer().RemoveSpell(spellToRemove)
endEvent
