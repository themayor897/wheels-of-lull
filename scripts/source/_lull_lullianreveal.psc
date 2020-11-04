Scriptname _Lull_LullianReveal extends ObjectReference  

Spell Property visorProjectile1 auto
ObjectReference Property thingtoEnable auto
ObjectReference Property teartoDisable auto
bool doOnce = false

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, \
  bool abBashAttack, bool abHitBlocked)
	Spell akSpell = akSource as Spell
	;Debug.MessageBox("Fuck you and fuck your maker")
	if(akSpell == visorProjectile1)
		if(!doOnce)
			;Debug.MessageBox("Fuck him too")
			thingtoEnable.EnableNoWait(true)
			teartoDisable.DisableNoWait(true)
			doOnce = true
		endif
	endif
EndEvent