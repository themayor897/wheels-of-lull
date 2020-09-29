Scriptname _Lull_FabricantUndeadMaster extends Actor

Weapon Property goverisunwinder Auto

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	Weapon akWeapon = akSource as Weapon
	if(akWeapon == goverisunwinder)
		self.Kill()
	endif
EndEvent