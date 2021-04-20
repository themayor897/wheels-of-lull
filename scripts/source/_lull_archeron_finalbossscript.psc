Scriptname _Lull_Archeron_FinalBossScript extends Actor 

;For hitting
Enchantment Property ohmsBlast auto
Spell Property visorPing auto
Spell Property lullianProjectile auto
Weapon Property unwinder auto
Spell Property explosionFX auto

bool archeronWeak = false;
int archeronHits = 0 ;
Float HitDamage


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
bool doOnce = FALSE

;Effects
int randomEffect
Spell Property blueFX auto
Spell Property redFX auto
Spell Property greenFX auto
Spell Property purpleFX auto
Quest Property mq07 auto
MusicType Property archeronFight auto

;Post Scene

Topic Property AllTheStops auto
Activator Property xMarkerActivator auto

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
   if (aeCombatState == 1)
		if(archeron.GetParentCell() == finalBossCell)
			RegisterForSingleUpdate(8)
			WoL.Log(self, "Archeron fight commencing...")
			if(!doOnce)
				CheckHealth(self)
				doOnce = TRUE
			endif
		endif
  endIf
endEvent

Event OnUpdate()
	if (!self.isDisabled())
		if(archeronWeak)
			archeronWeak = false
			archeron.RemoveSpell(purpleFX)
			archeron.setDontMove(false)
			randomAttack = 2
			WoL.Log(self, "Player did not Lullian Bash Archeron in time, reset vulnerability.")
		else
			randomAttack = Utility.RandomInt(0, 2)
		endif
		randomLocation = Utility.RandomInt(0, 3)
		if(randomAttack == 0)
			WoL.Log(self, "Archeron single teleport")
			RandomTeleport()
		elseif(randomAttack == 1)
			WoL.Log(self, "Archeron rapid random teleport")
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
			WoL.Log(self, "Archeron fireball and teleport")
			ObjectReference fireShot = archeron.PlaceAtMe(fireShooter)
			fireShot.SetPosition(fireShot.GetPositionX(), fireShot.GetPositionY(), fireShot.GetPositionZ() + 10)
			RandomTeleport()
		endif
		RegisterForSingleUpdate(8)
	endif
EndEvent

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack,   bool abBashAttack, bool abHitBlocked)
	Weapon akWeapon = akSource as Weapon
	Enchantment akEnchant = akSource as Enchantment
	Spell akSpell = akSource as Spell
	;0 is ohm, 1 is visor, 2 is goveri
	if(!archeronWeak) ;Archeron does NOT have purple glow/vulnerability to shield
		if(akEnchant == ohmsBlast && randomEffect == 0)
			WoL.Log(self, "Archeron hit with Rod of Ohm")
			archeron.RemoveSpell(blueFX)
			HitArcheron()
		elseif(akSpell == visorPing && randomEffect == 1)
			WoL.Log(self, "Archeron hit with visor ping")
			archeron.RemoveSpell(redFX)
			HitArcheron()
		elseif(akWeapon == unwinder && randomEffect == 2)
			WoL.Log(self, "Archeron hit with Unwinder")
			archeron.RemoveSpell(greenFX)
			HitArcheron()	
		endif
	else
		if(akSpell == lullianProjectile)
			UnregisterForUpdate()
			explosionFX.Cast(self, Game.GetPlayer())
			archeronHits += 1
			WoL.Log(self, "Archeron full hit registered")
			if(archeronHits >= 5)
				TransToRamon()
			else
				archeronWeak = false
				archeron.RemoveSpell(purpleFX)
				archeron.setDontMove(false)
				RegisterForSingleUpdate(0.5)
				WoL.Log(self, "Resetting Archeron Position...")
			endif
		endif
	endif
EndEvent

Function RandomTeleport()
		WoL.Log(self, "Archeron Random Teleport")
		archeron.PlaceAtMe(teleportEffect)
		if(randomLocation == 0)
			archeron.MoveTo(teleportMarker1)
			archeron.Resurrect()
			archeron.DamageAV("health", ((archeronhits as float)*HitDamage))
			RandomEffect()
			archeron.StartCombat(Game.GetPlayer())
		elseif(randomLocation == 1)
			archeron.MoveTo(teleportMarker2)
			archeron.Resurrect()
			archeron.DamageAV("health", ((archeronhits as float)*HitDamage))
			RandomEffect()
			archeron.StartCombat(Game.GetPlayer())
		elseif(randomLocation == 2)
			archeron.MoveTo(teleportMarker3)
			archeron.Resurrect()
			archeron.DamageAV("health", ((archeronhits as float)*HitDamage))
			RandomEffect()
			archeron.StartCombat(Game.GetPlayer())
		elseif(randomLocation == 3)	
			archeron.MoveTo(teleportMarker4)
			archeron.Resurrect()
			archeron.DamageAV("health", ((archeronhits as float)*HitDamage))
			RandomEffect()
			archeron.StartCombat(Game.GetPlayer())
		endif
EndFunction

Function RandomEffect()
	WoL.Log(self, "Archeron Random Effect")
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
	WoL.Log(self, "Archeron initial hit registered")
	UnregisterForUpdate()
	archeron.AddSpell(purpleFX)
	archeronWeak = true
	archeron.SetDontMove(true)
	RegisterForSingleUpdate(6)
EndFunction

Function TransToRamon()
	WoL.Log(self, "Transitioning to Ramon...")
	archeron.ForceActorValue("health", 4)
	archeronFight.Remove()
	archeron.stopcombat()
	UnregisterForUpdate()
	;ObjectReference ArchSay = Game.GetPlayer().PlaceAtMe(xMarkerActivator)
	;ArchSay.Say(AllTheStops, Archeron, True)
	explosionFX.Cast(self, Game.GetPlayer())
	Utility.Wait(1.5)
	explosionFX.Cast(self, Game.GetPlayer())
	Utility.Wait(0.5)
	explosionFX.Cast(self, Game.GetPlayer())
	Utility.Wait(2.5)
	explosionFX.Cast(self, Game.GetPlayer())
	Utility.Wait(0.5)
	MQ07.setstage(8)
EndFunction

Function CheckHealth(Actor akActor)
	Float BaseValue = akActor.GetBaseActorValue("Health")
	Float CurrentMaxValue = Math.Ceiling(akActor.GetActorValue("Health") / akActor.GetActorValuePercentage("Health"))
	Float ValueDifference = CurrentMaxValue - (akactor.GetActorValue("Health"))
	akactor.RestoreAV("Health", ValueDifference)
	HitDamage = ((CurrentMaxValue / 5) - 1)
	WoL.log(self, "Archeron hit value calculated to be" + HitDamage)
EndFunction
