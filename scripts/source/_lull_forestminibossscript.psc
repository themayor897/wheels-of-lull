Scriptname _Lull_ForestMinibossScript extends ObjectReference  

Actor Property clone1 auto;
Actor Property clone2 auto;
Actor Property boss auto
int numHits = 0; Every 3 hits, and if 20 seconds have elapsed, he'll do the clone thing.
int randomLocation
bool doOnce = false
Activator Property teleportEffect auto ;Place this everytime he clones himself.
ObjectReference Property sword auto; Place this once dead as a reward.

ObjectReference Property marker1 auto
ObjectReference Property marker2 auto
ObjectReference Property marker3 auto
Spell Property effectSpell auto
ObjectReference Property pedestal auto
MusicType Property minibossMusic auto


Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	numHits += 1
	if(numHits >= 3)
		if(!doOnce)
			doOnce = true
			boss.PlaceAtme(teleportEffect)
			;Roll a random int, resurrect the clones and move the boss to the new location.
			randomLocation = Utility.RandomInt(0, 2)
			clone1.Resurrect()
			clone2.Resurrect()
			clone1.EnableNoWait(1)
			clone2.EnableNoWait(1)
			if(randomLocation == 0)
				boss.MoveTo(marker1)
				clone1.MoveTo(marker2)
				clone2.MoveTo(marker3)
			elseif(randomLocation == 1)
				boss.MoveTo(marker2)
				clone1.MoveTo(marker3)
				clone2.MoveTo(marker1)
			elseif(randomLocation == 2)
				boss.MoveTo(marker3)
				clone1.MoveTo(marker1)
				clone2.MoveTo(marker2)
			endif
			Utility.Wait(20)
			numHits = 0
			doOnce = false
		endif
	endif
EndEvent

Event OnDeath(Actor akKiller)
	clone1.DisableNoWait()
	clone2.DisableNoWait()
	effectSpell.Cast(pedestal, pedestal)
	sword.EnableNoWait()
	minibossMusic.Remove()
EndEvent