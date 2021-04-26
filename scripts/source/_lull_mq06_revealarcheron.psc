Scriptname _Lull_MQ06_RevealArcheron extends ActiveMagicEffect  

Actor Property Fyr auto
Actor Property Archeron auto
Actor Property Yagrum auto
Actor Property Masscroft auto

ObjectReference Property ArcheronMarker auto
ObjectReference Property MasscroftMarker auto

Spell Property ExplosionSpell auto

Event OnEffectStart(Actor Target, Actor Caster)
	ArcheronMarker.moveto(Fyr)
	MasscroftMarker.MoveTo(Yagrum)
	Fyr.Disable()
	Yagrum.Disable()
	WoL.Log(Caster, "Markers moved, Fyr and Yagrum disabled.")
EndEvent

Event OnEffectFinish (Actor Target, Actor Caster)
	Archeron.MoveTo(ArcheronMarker)
	Masscroft.MoveTo(MasscroftMarker)
	Archeron.evaluatepackage()
	Masscroft.evaluatepackage()
	WoL.Log(caster, "Archeron and Masscroft moved, packages updating...")
EndEvent 