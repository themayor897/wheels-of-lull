Scriptname _Lull_Bottom_CrestEffectScript extends ObjectReference  

Spell Property effectSpell auto
ObjectReference Property indicator auto
ObjectReference Property reciever auto


Event OnCellAttach()
	if(indicator.IsEnabled())
		effectSpell.Cast(self, reciever)
	endif
endEvent