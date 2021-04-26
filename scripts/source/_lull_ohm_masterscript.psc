Scriptname _Lull_Ohm_MasterScript extends ObjectReference  

Enchantment Property ohmSpell auto
ObjectReference Property disableOrMoveTo auto
ObjectReference Property enableOrMoveWith auto
Float Property movementSpeed auto
weapon property ohmsRod auto
Int Property eventType auto;
Spell Property effectSpell auto							   

Actor Property PlayerRef auto
Message Property NeedOhm auto
Message Property UseOhm auto

bool doOnce = false								 

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	Enchantment akSpell = akSource as Enchantment 
	if(akSpell == ohmSpell)
		if(!doOnce)
			effectSpell.Cast(self, self)
			if(eventType == 1)
				enableOrMoveWith.EnableNoWait(1)
				disableOrMoveTo.DisableNoWait(1)
			else
				enableOrMoveWith.TranslateToRef(disableOrMoveTo, movementSpeed)
			endif
			doOnce = true
		endif
	endif
EndEvent

Event OnActivate(ObjectReference akActionRef)

	if PlayerRef.GetItemCount(ohmsRod) < 1
		NeedOhm.Show()
	else
		UseOhm.Show()
	endIf
endEvent
