Scriptname _Lull_MQ06_RevealArcheron extends ActiveMagicEffect  

Actor Property Fyr auto
Actor Property Archeron auto
Actor Property Yagrum auto
Actor Property Masscroft auto

ObjectReference Property ArcheronMarker auto
ObjectReference Property MasscroftMarker auto

Event OnEffectStart(Actor Target, Actor Caster)
	ArcheronMarker.moveto(Fyr)
	Fyr.DisableNoWait()
	Archeron.MoveTo(ArcheronMarker)
	MasscroftMarker.MoveTo(Yagrum)
	Yagrum.DisableNoWait()
	Masscroft.MoveTo(MasscroftMarker)
	Archeron.evaluatepackage()
	Masscroft.evaluatepackage()
EndEvent