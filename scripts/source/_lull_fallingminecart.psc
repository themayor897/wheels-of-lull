Scriptname _Lull_FallingMinecart extends ObjectReference

Spell Property explodespell auto
ObjectReference Property Cart auto


Event OnTranslationComplete()
	explodespell.Cast(self, self)
	self.disablenowait()
	cart.enablenowait()
EndEvent


