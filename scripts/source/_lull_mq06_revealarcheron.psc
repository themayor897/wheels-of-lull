Scriptname _Lull_MQ06_RevealArcheron extends ActiveMagicEffect  

Actor Property Fyr auto
Actor Property Archeron auto
Actor Property Yagrum auto
Actor Property Masscroft auto

ObjectReference Property ArcheronMarker auto
ObjectReference Property MasscroftMarker auto

Explosion Property IllusionMassiveLight auto
ImageSpaceModifier Property FadeToWhite Auto

Event OnEffectStart(Actor Target, Actor Caster)
	Fyr.PlaceAtMe(IllusionMassiveLight)
	Utility.Wait(0.5)
	FadeToWhite.Apply()
	Fyr.Disable()
	Yagrum.Disable()
	WoL.Log(Caster, "Fyr and Yagrum disabled.")
EndEvent

Event OnEffectFinish (Actor Target, Actor Caster)
	Archeron.MoveTo(ArcheronMarker)
	Masscroft.MoveTo(MasscroftMarker)
	Archeron.evaluatepackage()
	Masscroft.evaluatepackage()
	FadeToWhite.Remove()
	WoL.Log(caster, "Archeron and Masscroft moved, packages updating...")
EndEvent 