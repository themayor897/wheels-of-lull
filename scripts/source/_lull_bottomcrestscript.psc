Scriptname _Lull_BottomCrestScript extends ObjectReference  

Spell Property effectSpell auto
GlobalVariable Property bottomVariable auto
ObjectReference Property projector auto
ObjectReference Property reciever auto
ObjectReference Property doorToUnlock auto

Event OnCellAttach()
	if(bottomVariable.GetValue() >= 2)
		doorToUnlock.Lock(false, true)
		effectSpell.Cast(self, reciever)
	endif
endEvent