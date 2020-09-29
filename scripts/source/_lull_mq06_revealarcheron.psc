Scriptname _Lull_MQ06_RevealArcheron extends ActiveMagicEffect  
Actor Property Fyr auto
Actor Property Archeron auto
Actor Property Yagrum auto
Actor Property Masscroft auto

Event OnEffectStart(Actor Target, Actor Caster)
	Archeron.MoveTo(Fyr)
	Fyr.DisableNoWait()
	Masscroft.MoveTo(Yagrum)
	Yagrum.DisableNoWait()
EndEvent