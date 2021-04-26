ScriptName _Lull_SQWaterBottleScript extends ObjectReference

;modified 4.25.21 by themayor897. Decompiled script that had old source, silenced UI notifications for add spell, Swapped getplayer calls for playerref

Bool property isRefillable auto
spell property filledBottleSpell auto
spell property waterPotionSpell auto

Actor property PlayerRef auto

Event OnEquipped(Actor akActor)

	if !isRefillable
		PlayerRef.AddSpell(filledBottleSpell, False)
	else
		PlayerRef.AddSpell(waterPotionSpell, False)
	endIf
endEvent