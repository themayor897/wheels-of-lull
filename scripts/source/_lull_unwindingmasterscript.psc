Scriptname _Lull_UnwindingMasterScript extends ObjectReference  



import utility
import debug

Keyword Property LinkCustom01 Auto
Weapon Property goverisUnwinder auto
ObjectReference Property thingEnabled auto
Spell Property effectSpell auto
bool doOnce = false;
Float Property fDelayBeforeLooping = 5.0 Auto
{(OPTIONAL)(Only matters if you havea LinkRef with LinkCustom01)Amount of time, in seconds, before steam turns on and 'hits' the resonator. (DEFAULT = 5.0 Seconds)}
Float Property fDelayBeforeLoopingBack = 3.0 Auto
{(OPTIONAL)(Only matters if you havea LinkRef with LinkCustom01)Amount of time, in seconds, before resonater drops back down in order for steam to hit it again. (DEFAULT = 3.0 Seconds)}

bool bBeenHit = FALSE

Event OnCellAttach()
	if (GetLinkedRef(LinkCustom01))
		StartLooping()
	endif
EndEvent


auto STATE sWaitingForHit


	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		Weapon akWeapon = akSource as Weapon
		if(akWeapon == goverisUnWinder)
			if(!doOnce)
				bBeenHit = TRUE
				GoToState("sBeenHit")
				PlayAnimationAndWait("open", "done")
				thingEnabled.EnableNoWait(1)
				effectSpell.Cast(self,game.getplayer())
				doOnce = TRUE
			endif
		endif

	EndEvent

ENDSTATE



STATE sBeenHit

	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

		;Do Nothing

	EndEvent

ENDSTATE




Function StartLooping()
	While self.Is3DLoaded()
		;Wait(RandomFloat(WaitForRumbleMin, WaitForRumbleMax))
		Wait(fDelayBeforeLooping)
		GetLinkedRef(LinkCustom01).EnableNoWait(1)
		Wait(0.25)

		if((self.Is3DLoaded()) && (bBeenHit == FALSE))
			GoToState("sBeenHit")
			PlayAnimationAndWait("open", "done")
			GetLinkedRef().SetOpen()
			Wait(2)
			GetLinkedRef(LinkCustom01).DisableNoWait(1)
			Wait(fDelayBeforeLoopingBack)
			PlayAnimationAndWait("close", "done")
			GetLinkedRef().SetOpen(FALSE)
			GoToState("sWaitingForHit")
		elseif((self.Is3DLoaded()) && (bBeenHit == TRUE)) 
			Wait(2)
			GetLinkedRef(LinkCustom01).DisableNoWait(1)
			Wait(fDelayBeforeLoopingBack)
		endif

	EndWhile

EndFunction