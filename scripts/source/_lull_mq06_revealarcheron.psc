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
	FadeToWhite.Apply()
	Utility.Wait(2)
	Fyr.Disable()
	Yagrum.Disable()
	WoL.Log(Caster, "Fyr and Yagrum disabled.")
EndEvent

Event OnEffectFinish (Actor Target, Actor Caster)
	Utility.Wait(0.5)
	Archeron.MoveTo(ArcheronMarker)
	Masscroft.MoveTo(MasscroftMarker)
	Utility.Wait(1)
	Archeron.evaluatepackage()
	Masscroft.evaluatepackage()
	WoL.Log(caster, "Archeron and Masscroft moved, packages updating...")
EndEvent 