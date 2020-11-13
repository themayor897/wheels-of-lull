Scriptname _Lull_Boiling_KingScriptSwitch extends ObjectReference  


Enchantment Property ohmSpell auto
ActorBase Property kingBase auto
ObjectReference Property enableOrMoveWith auto
Spell Property effectSpell auto
GlobalVariable Property kingIsIn auto
Sound Property kingScream auto
Actor Property king auto
Weapon Property ohmsRod auto

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	Enchantment akSpell = akSource as Enchantment 
	if(akSpell == ohmSpell)
			effectSpell.Cast(self, self)
			enableOrMoveWith.EnableNoWait(1)
				if(kingIsIn.GetValue() == 1)
					;We can assume the boss is in the trigger zone
					king.SetDontMove(true)
					kingBase.SetInvulnerable(false)
					kingScream.Play(Game.GetPlayer())
				endif
				Utility.Wait(2)
				enableOrMoveWith.DisableNoWait(1)
				Utility.Wait(5)
				kingBase.SetInvulnerable(true)
				king.SetDontMove(false)
				self.DisableNoWait(1)
				Utility.Wait(45)
				self.EnableNoWait(1)			
	endif
EndEvent

Event OnActivate(ObjectReference akActionRef)

	if game.GetPlayer().GetItemCount(ohmsRod) < 1
		debug.MessageBox("It looks like you'll need some sort of special staff to activate this, and you feel like you won't find that staff until you help out the Chronographers more.")
	else
		debug.MessageBox("It seems like you should shoot this switch with your Rod of Ohm. This is extremely obvious, and you feel like a complete idiot for not realizing it.")
	endIf
endEvent