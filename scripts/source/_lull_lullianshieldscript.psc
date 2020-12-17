Scriptname _Lull_LullianShieldScript extends ActiveMagicEffect  

Actor selfRef
Actor Property PlayerRef auto
Spell  Property ChargeSpell1 Auto
Sound Property castSound auto

EVENT OnEffectStart(Actor Target, Actor Caster)	
	selfRef = caster
	if (selfref == PlayerRef)
		registerForAnimationEvent(caster, "bashRelease")
	else
		registerForAnimationEvent(caster, "bashExit")
		registerForAnimationEvent(caster, "bashStop")
	endif
	;debug.trace("Registering for Single Update")
ENDEVENT
	

Event OnAnimationEvent(ObjectReference akSource, string EventName)
	
	if (selfref == PlayerRef)
		if (eventName == "bashRelease")
			ChargeSpell1.cast(PlayerRef)
			castSound.Play(PlayerRef)
			;debug.Notification("Shield at LEVEL 0")
		endif
	else
		if (eventName == "bashExit") || (eventName == "bashStop")
			ChargeSpell1.cast(selfRef)
			castSound.Play(PlayerRef)
			selfRef.SetSubGraphFloatVariable("fToggleBlend", 0)
			;debug.Notification("Shield at LEVEL 0")
		endif
	endif
		
endEVENT 