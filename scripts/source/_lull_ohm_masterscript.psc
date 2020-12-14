Scriptname _Lull_Ohm_MasterScript extends ObjectReference  

Enchantment Property ohmSpell auto
ObjectReference Property disableOrMoveTo auto
ObjectReference Property enableOrMoveWith auto
Float Property movementSpeed auto
weapon property ohmsRod auto
Int Property eventType auto;
Spell Property effectSpell auto							   

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
				Utility.Wait(0.5)
				enableOrMoveWith.DisableNoWait(1)
			endif
			doOnce = true
		endif
	endif
EndEvent

Event OnActivate(ObjectReference akActionRef)

	if game.GetPlayer().GetItemCount(ohmsRod) < 1
		debug.MessageBox("It looks like you'll need some sort of special staff to activate this, and you feel like you won't find that staff until you help out the Chronographers more.")
	else
		debug.MessageBox("It seems like you should shoot this switch with your Rod of Ohm. This is extremely obvious, and you feel like a complete idiot for not realizing it.")
	endIf
endEvent
