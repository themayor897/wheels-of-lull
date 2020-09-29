Scriptname _Lull_Boiling_KingScriptSwitch extends ObjectReference  


Enchantment Property ohmSpell auto
ActorBase Property kingBase auto
ObjectReference Property enableOrMoveWith auto
Spell Property effectSpell auto
GlobalVariable Property kingIsIn auto
Sound Property kingScream auto
Actor Property king auto

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
