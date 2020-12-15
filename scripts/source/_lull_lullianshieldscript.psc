Scriptname _Lull_LullianShieldScript extends ActiveMagicEffect  

Actor selfRef
Spell  Property ChargeSpell1 Auto
Sound Property castSound auto

EVENT OnEffectStart(Actor Target, Actor Caster)	
	selfRef = caster
	if (selfref == Game.GetPlayer())
		registerForAnimationEvent(selfRef, "bashRelease")
	else
		registerForAnimationEvent(selfRef, "bashExit")
		registerForAnimationEvent(selfRef, "bashStop")
	endif
	;debug.trace("Registering for Single Update")
ENDEVENT



EVENT OnEffectFinish(Actor Target, Actor Caster)	
	unregisterForAnimationEvent(selfRef, "bashRelease")
	unregisterForAnimationEvent(selfRef, "bashExit")
	unregisterForAnimationEvent(selfRef, "bashStop")
ENDEVENT
	

Event OnAnimationEvent(ObjectReference akSource, string EventName)
	
	if (selfref == Game.GetPlayer())
		if (eventName == "bashRelease")
			ChargeSpell1.cast(selfRef)
			castSound.Play(Game.GetPlayer())
			;debug.Notification("Shield at LEVEL 0")
		endif
	else
		if (eventName == "bashExit") || (eventName == "bashStop")
			ChargeSpell1.cast(selfRef)
			castSound.Play(Game.GetPlayer())
			selfRef.SetSubGraphFloatVariable("fToggleBlend", 0)
			;debug.Notification("Shield at LEVEL 0")
		endif
	endif
		
endEVENT