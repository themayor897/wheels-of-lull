Scriptname _Lull_ArcheronFireShootScript extends ObjectReference  

Spell Property fireSpell auto

Event OnLoad()
	Utility.Wait(2)
	fireSpell.Cast(self, Game.GetPlayer())
	Utility.Wait(2)
	Self.Disable()
	Utility.Wait(1)
	Self.Delete()
EndEvent