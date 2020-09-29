Scriptname _Lull_Bottom_Pedestal extends ObjectReference  

Actor Property target auto
ObjectReference Property projector auto 
ObjectReference Property shock auto ;0
ObjectReference Property unwind auto ;1
ObjectReference Property ping auto ;2
Spell Property attackSpell auto
Sound Property stopSound auto
int typeOfAttack

Weapon Property goverisUnwinder auto
Spell Property lullPing auto
Enchantment Property ohmsHit auto

Event OnLoad()
	typeOfAttack = Utility.RandomInt(0, 2)
	if(typeOfAttack == 0)
		shock.EnableNoWait(1)
		unwind.DisableNoWait(1)
		ping.DisableNoWait(1)
	elseif(typeOfAttack == 1)
		shock.DisableNoWait(1)
		unwind.EnableNoWait(1)
		ping.DisableNoWait(1)
	elseif(typeOfAttack == 2)
		shock.DisableNoWait(1)
		unwind.DisableNoWait(1)
		ping.EnableNoWait(1)
	endif
EndEvent

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	Spell akSpell = akSource as Spell
	Enchantment akEnchant = akSource as Enchantment
	Weapon akWeapon = akSource as Weapon

	if(typeofAttack == 0)
		if(akEnchant == ohmsHit)
			attackSpell.Cast(projector, target)
			Utility.Wait(3)
			projector.InterruptCast()
			typeOfAttack = Utility.RandomInt(0, 2)
			if(typeOfAttack == 0)
				shock.EnableNoWait(1)
				unwind.DisableNoWait(1)
				ping.DisableNoWait(1)
			elseif(typeOfAttack == 1)
				shock.DisableNoWait(1)
				unwind.EnableNoWait(1)
				ping.DisableNoWait(1)
			elseif(typeOfAttack == 2)
				shock.DisableNoWait(1)
				unwind.DisableNoWait(1)
				ping.EnableNoWait(1)
			endif
		endif

	elseif(typeOfAttack == 1)
		if(akWeapon == goverisUnwinder)
			attackSpell.Cast(projector, target)
			Utility.Wait(3)
			projector.InterruptCast()
			typeOfAttack = Utility.RandomInt(0, 2)
			if(typeOfAttack == 0)
				shock.EnableNoWait(1)
				unwind.DisableNoWait(1)
				ping.DisableNoWait(1)
			elseif(typeOfAttack == 1)
				shock.DisableNoWait(1)
				unwind.EnableNoWait(1)
				ping.DisableNoWait(1)
			elseif(typeOfAttack == 2)
				shock.DisableNoWait(1)
				unwind.DisableNoWait(1)
				ping.EnableNoWait(1)
			endif
		endif

	elseif(typeOfAttack == 2)
		if(akSpell == lullPing )
			attackSpell.Cast(projector, target)
			Utility.Wait(3)
			projector.InterruptCast()
			typeOfAttack = Utility.RandomInt(0, 2)
			if(typeOfAttack == 0)
				shock.EnableNoWait(1)
				unwind.DisableNoWait(1)
				ping.DisableNoWait(1)
			elseif(typeOfAttack == 1)
				shock.DisableNoWait(1)
				unwind.EnableNoWait(1)
				ping.DisableNoWait(1)
			elseif(typeOfAttack == 2)
				shock.DisableNoWait(1)
				unwind.DisableNoWait(1)
				ping.EnableNoWait(1)
			endif
		endif
	endif
EndEvent
