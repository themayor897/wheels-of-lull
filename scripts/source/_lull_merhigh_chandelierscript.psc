Scriptname _Lull_MerHigh_ChandelierScript extends ObjectReference  
ObjectReference Property endMarker auto
Actor Property deadMer auto
Spell Property explosionSpell auto
bool doOnce = false
Event OnActivate(ObjectReference akActionRef)
	if(!doOnce)
		doOnce = true
		self.TranslateToRef(endMarker, 600)
	endif
EndEvent


Event OnTranslationComplete()
	explosionSpell.Cast(self, self)
	deadMer.DisableNoWait()
	self.DisableNoWait()
EndEvent