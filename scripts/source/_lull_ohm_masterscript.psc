Scriptname _Lull_Ohm_MasterScript extends ObjectReference  

Enchantment Property ohmSpell auto
ObjectReference Property disableOrMoveTo auto
ObjectReference Property enableOrMoveWith auto
Float Property movementSpeed auto
Spell Property effectSpell auto
bool doOnce = false
Int Property eventType auto;

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
				Utility.Wait(2)
				enableOrMoveWith.DisableNoWait(1)
			endif
			doOnce = true
		endif
	endif
EndEvent