Scriptname _Lull_Forest_BossMasterScript extends ObjectReference  

ActorBase Property familyMan auto
ActorBase Property tho auto
;Platforms where familymen spawn
ObjectReference Property spawnPlatform1 auto
ObjectReference Property spawnPlatform2 auto
ObjectReference Property spawnPlatform3 auto
ObjectReference Property spawnPlatform4 auto
ObjectReference Property spawnPlatform5 auto
Actor Property meBoss auto

GlobalVariable Property isInCoffin auto
Spell Property effectSpellCoffin auto
ObjectReference Property coffin auto 
ObjectReference Property coffinHider auto ;Place he teleports to when "hiding" in his coffin

Activator Property teleportEffect auto
Spell Property explosionSpell auto
int numHits = 0;

Spell Property attackSpell auto;
bool isInPlay
bool assignOnce = false
float healthSince = 0.0;
float currentHealth = 0.0;
Sound Property thoMad auto
Enchantment Property goverisUnwind auto
Weapon Property goverisUnwinder auto

ImagespaceModifier Property blackOut auto
Topic Property FyrTopic auto
Activator Property xMarkerActivator auto
Actor Property fyr auto
ObjectReference Property playerMarker auto
MusicType Property bossMusic auto
Quest Property MQ05 auto

Event OnLoad()
	RegisterForSingleUpdate(15)
	isInPlay = TRUE
	healthSince = meBoss.GetBaseActorValue("Health")
EndEvent

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if(!assignOnce)
		meBoss.SetActorValue("Health", 1700)
		healthSince = meBoss.GetActorValue("Health")
		assignOnce = TRUE
	endif
	Weapon akWeapon = akSource as Weapon
	currentHealth = meBoss.GetActorValue("Health")
	if(akWeapon == goverisUnwinder)
		if(!isInPlay)
			UnregisterForUpdate()
			meBoss.RemoveSpell(effectSpellCoffin)
			isInPlay = TRUE
			tho.SetInvulnerable(false)
			meBoss.SetDontMove(false)
			RegisterForSingleUpdate(15)
			thoMad.Play(Game.GetPlayer())
		endif
	endif
	if(healthSince - currentHealth >= 200)
		if(isInPlay)
			isInPlay = FALSE
			healthSince = meBoss.GetActorValue("Health")
			meBoss.PlaceAtme(teleportEffect, 1)
			meBoss.AddSpell(effectSpellCoffin)
			tho.SetInvulnerable(true)
			meBoss.SetDontMove()
			UnregisterForUpdate()
			spawnPlatform1.PlaceAtMe(teleportEffect, 1)
			spawnPlatform1.PlaceAtMe(familyMan, 1)
			spawnPlatform2.PlaceAtMe(teleportEffect, 1)
			spawnPlatform2.PlaceAtMe(familyMan, 1)
			spawnPlatform3.PlaceAtMe(teleportEffect, 1)
			spawnPlatform3.PlaceAtMe(familyMan, 1)
			spawnPlatform4.PlaceAtMe(teleportEffect, 1)
			spawnPlatform4.PlaceAtMe(familyMan, 1)
			spawnPlatform5.PlaceAtMe(teleportEffect, 1)
			spawnPlatform5.PlaceAtMe(familyMan, 1)
			RegisterForSingleUpdate(15)
		endif
	endif
EndEvent

Event OnUpdate()
	if(isInPlay)
		Debug.SendAnimationEvent(meBoss, "idleStartScan")
		attackSpell.Cast(meBoss, Game.GetPlayer())
		RegisterForSingleUpdate(15)
	else
		meBoss.RestoreActorValue("Health", 200)
		meBoss.RemoveSpell(effectSpellCoffin)
		explosionSpell.Cast(meBoss, Game.GetPlayer())
		tho.SetInvulnerable(false)
		meBoss.SetDontMove(false)
		isInPlay = TRUE
		RegisterForSingleUpdate(15)
	endif
EndEvent

Event OnDeath(Actor akKiller)
	bossMusic.Remove()
	UnregisterForUpdate()
	Game.DisablePlayerControls()
	explosionSpell.Cast(meBoss, Game.GetPlayer())
	Game.ShakeCamera(Game.GetPlayer(), 1, 10)
	Utility.Wait(1)
	explosionSpell.Cast(spawnPlatform1, Game.GetPlayer())
	Utility.Wait(1)
	explosionSpell.Cast(spawnPlatform2, Game.GetPlayer())
	Utility.Wait(1)
	explosionSpell.Cast(spawnPlatform3, Game.GetPlayer())
	Utility.Wait(1)
	explosionSpell.Cast(spawnPlatform4, Game.GetPlayer())
	Utility.Wait(1)
	explosionSpell.Cast(spawnPlatform5, Game.GetPlayer())	
	blackOut.Apply()
	Utility.Wait(4)
	ObjectReference fyrSay = Game.GetPlayer().PlaceAtMe(xMarkerActivator)
	fyrSay.Say(FyrTopic, fyr, true)
	Utility.Wait(6)
	Game.GetPlayer().MoveTo(playerMarker)
	blackout.Remove()
	MQ05.SetStage(15)
	Game.EnablePlayerControls()
endEvent