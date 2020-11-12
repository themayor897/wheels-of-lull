Scriptname _Lull_LullianShieldScript extends ActiveMagicEffect  
;script edited by EggOver1979 11/10/20

;Actor selfRef
Spell Property ChargeSpell1 Auto
Sound Property castSound auto

EVENT OnEffectStart(Actor Target, Actor Caster)	
	;selfRef = caster
	;debug.notification("Lullian Shield: Equipped on " + Target.GetName())
	if (Target == Game.GetPlayer())
		registerForAnimationEvent(Target, "bashRelease")
		registerForAnimationEvent(Target, "bashExit")
		registerForAnimationEvent(Target, "bashStop")
	endif
	;debug.trace("Registering for Single Update")
ENDEVENT



EVENT OnEffectFinish(Actor Target, Actor Caster)	
	;debug.notification("Lullian Shield: Unequipped on " + Target.GetName())
	unregisterForAnimationEvent(Target, "bashRelease")
	unregisterForAnimationEvent(Target, "bashExit")
	unregisterForAnimationEvent(Target, "bashStop")
ENDEVENT
	

Event OnAnimationEvent(ObjectReference akSource, string EventName)
	
	if (akSource == Game.GetPlayer())
		if (eventName == "bashRelease")
			;debug.notification("Lullian Shield: Bash Release by " + akSource.GetName() + " | Casting " + ChargeSpell1.GetName())
			ChargeSpell1.cast(akSource)
			castSound.Play(akSource)
			;debug.Notification("Shield at LEVEL 0")
		elseif (eventName == "bashExit") || (eventName == "bashStop")
			;debug.notification("Lullian Shield: Bash Exit or Bash Stop by " + akSource.GetName() + " | Casting " + ChargeSpell1.GetName())
			ChargeSpell1.cast(akSource)
			castSound.Play(akSource)
			(akSource as Actor).SetSubGraphFloatVariable("fToggleBlend", 0)
			;debug.Notification("Shield at LEVEL 0")
		endif
	endif
		
endEVENT
