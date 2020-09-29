Scriptname _Lull_Archeron_FinalBossScript extends ObjectReference  
;Master
ObjectReference Property moveToRamon auto

;For hitting
Enchantment Property ohmsBlast auto
Spell Property visorPing auto
Spell Property lullianProjectile auto
Weapon Property unwinder auto
Spell Property explosionFX auto

bool archeronWeak = false;
int archeronHits = 0 ;

;Teleportation
int randomLocation;
int randomAttack; 0 is teleport normal, 1 is teleport spam, 2 is teleport attack.
Activator Property teleportEffect auto;
Activator Property fireShooter auto;
ObjectReference Property teleportMarker1 auto
ObjectReference Property teleportMarker2 auto
ObjectReference Property teleportMarker3 auto
ObjectReference Property teleportMarker4 auto
Spell Property archeronAttackSpell auto

;Initial
Cell Property finalBossCell auto
Actor Property archeron auto

;Effects
int randomEffect
Spell Property blueFX auto
Spell Property redFX auto
Spell Property greenFX auto
Spell Property purpleFX auto
Quest Property mq07 auto
MusicType Property archeronFight auto

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
   if (aeCombatState == 1)
		if(archeron.GetParentCell() == finalBossCell)
			RegisterForSingleUpdate(8)
		endif
  endIf
endEvent

Event OnUpdate()
	if(archeronWeak)
		archeronWeak = false
		archeron.RemoveSpell(purpleFX)
		archeron.setDontMove(false)
		randomAttack = 2
	else
		randomAttack = Utility.RandomInt(0, 2)
	endif
	randomLocation = Utility.RandomInt(0, 3)
	if(randomAttack == 0)
		RandomTeleport()
	elseif(randomAttack == 1)
		RandomTeleport()
		randomLocation = Utility.RandomInt(0, 3)
		Utility.Wait(0.5)
		RandomTeleport()
		randomLocation = Utility.RandomInt(0, 3)
		Utility.Wait(0.5)	
		RandomTeleport()
		randomLocation = Utility.RandomInt(0, 3)
		Utility.Wait(0.5)	
		RandomTeleport()
	else
		ObjectReference fireShot = archeron.PlaceAtMe(fireShooter)
		fireShot.SetPosition(fireShot.GetPositionX(), fireShot.GetPositionY(), fireShot.GetPositionZ() + 10)
		RandomTeleport()
	endif
	RegisterForSingleUpdate(8)
EndEvent

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack,   bool abBashAttack, bool abHitBlocked)
	Weapon akWeapon = akSource as Weapon
	Enchantment akEnchant = akSource as Enchantment
	Spell akSpell = akSource as Spell
	;0 is ohm, 1 is visor, 2 is goveri
	if(!archeronWeak)
		if(akEnchant == ohmsBlast && randomEffect == 0)
			archeron.RemoveSpell(blueFX)
			HitArcheron()
		elseif(akSpell == visorPing && randomEffect == 1)
			archeron.RemoveSpell(redFX)
			HitArcheron()
		elseif(akWeapon == unwinder&& randomEffect == 2)
			archeron.RemoveSpell(greenFX)
			HitArcheron()	
		endif
	else
		if(akSpell == lullianProjectile)
			UnregisterForUpdate()
			explosionFX.Cast(self, Game.GetPlayer())
			archeronHits += 1
			if(archeronHits >= 5)
				explosionFX.Cast(self, Game.GetPlayer())
				Utility.Wait(1.5)
				explosionFX.Cast(self, Game.GetPlayer())
				Utility.Wait(0.5)
				explosionFX.Cast(self, Game.GetPlayer())
				Utility.Wait(2.5)
				explosionFX.Cast(self, Game.GetPlayer())
				Utility.Wait(0.5)
				mq07.SetStage(9)
				Game.GetPlayer().MoveTo(moveToRamon)
				archeronFight.Remove()
				archeron.DisableNoWait()
			else
				archeronWeak = false
				archeron.RemoveSpell(purpleFX)
				archeron.setDontMove(false)
				RegisterForSingleUpdate(0.5)
			endif
		endif
	endif
EndEvent

Function RandomTeleport()
		archeron.PlaceAtMe(teleportEffect)
		if(randomLocation == 0)
			archeron.MoveTo(teleportMarker1)
			archeron.Resurrect()
			RandomEffect()
			archeron.StartCombat(Game.GetPlayer())
		elseif(randomLocation == 1)
			archeron.MoveTo(teleportMarker2)
			archeron.Resurrect()
			RandomEffect()
			archeron.StartCombat(Game.GetPlayer())
		elseif(randomLocation == 2)
			archeron.MoveTo(teleportMarker3)
			archeron.Resurrect()
			RandomEffect()
			archeron.StartCombat(Game.GetPlayer())
		elseif(randomLocation == 3)	
			archeron.MoveTo(teleportMarker4)
			archeron.Resurrect()
			RandomEffect()
			archeron.StartCombat(Game.GetPlayer())
		endif
EndFunction

Function RandomEffect()
	archeron.RemoveSpell(blueFX)
	archeron.RemoveSpell(redFX)
	archeron.RemoveSpell(greenFX)
	randomEffect = Utility.RandomInt(0, 2)
	if(randomEffect == 0)
		archeron.AddSpell(blueFX)
	elseif(randomEffect == 1)
		archeron.AddSpell(redFX)
	elseif(randomEffect == 2)
		archeron.AddSpell(greenFX)
	endif
EndFunction

Function HitArcheron()
	UnregisterForUpdate()
	archeron.AddSpell(purpleFX)
	archeronWeak = true
	archeron.SetDontMove(true)
	RegisterForSingleUpdate(6)
EndFunction