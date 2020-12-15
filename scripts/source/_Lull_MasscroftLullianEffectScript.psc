Scriptname _Lull_MasscroftLullianEffectScript extends Actor  
{Lets previously invulernable enemies be hurt}

Spell Property lullSpell auto
ActorBase Property Masscroft auto


Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	Spell akSpell = akSource as Spell
	if(akSpell == lullSpell)
		Game.GetPlayer().PushActorAway(self, 15)
		Utility.Wait(2)
		endif
EndEvent