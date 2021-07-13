Scriptname _Lull_LullianShieldScript extends ActiveMagicEffect  

;Modified March 2021 by themayor897 to remove unnecessary functions leftover from Auriel's Shield Script, added stamina funtion set in MCM.
;Modified 4.20.21 by themayor897, added logging functions.


Actor selfRef
Actor Property PlayerRef auto
Spell  Property ChargeSpell1 Auto
Sound Property castSound auto
GlobalVariable Property _lull_shieldstamina auto

Float RestoreMyStamina

EVENT OnEffectStart(Actor Target, Actor Caster)	
	selfRef = caster
	if (selfref == PlayerRef)
		registerForAnimationEvent(selfRef, "bashRelease")
	else
		registerForAnimationEvent(selfRef, "bashExit")
		registerForAnimationEvent(selfRef, "bashStop")
	endif
	
	RestoreMyStamina = _lull_shieldstamina.GetValue()
	WoL.Log(PlayerRef, "Lullian shield effect started, registered for animation events. Restore stamina variable set to" + RestoreMyStamina as Int)
ENDEVENT
	

Event OnAnimationEvent(ObjectReference akSource, string EventName)
	
	if (selfref == PlayerRef)
		if (eventName == "bashRelease")
			ChargeSpell1.cast(PlayerRef)
			castSound.Play(PlayerRef)
			Utility.Wait(1)
			If RestoreMyStamina == 1
				PlayerRef.RestoreActorValue("stamina", 50)
			endif
		endif
	else
		if (eventName == "bashExit") || (eventName == "bashStop")
			ChargeSpell1.cast(selfRef)
			castSound.Play(PlayerRef)
		endif
	endif
		
endEVENT 