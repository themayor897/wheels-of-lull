Scriptname _Lull_LullianEffectMasterScript extends Actor  
{Lets previously invulernable enemies be hurt}

Spell Property lullSpell auto
ActorBase Property baseForActor auto

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	Spell akSpell = akSource as Spell
	if(akSpell == lullSpell)
		baseForActor.SetInvulnerable(false)
		Game.GetPlayer().PushActorAway(self, 15)
		Utility.Wait(2)
		baseForActor.SetInvulnerable(true)
	endif
EndEvent