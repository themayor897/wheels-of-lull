Scriptname _Lull_BottomLightScript extends ObjectReference  

GlobalVariable Property bottomVariable auto ;Hitting this lever will set this variable to 1
ObjectReference Property projector auto
ObjectReference Property reciever auto
Spell Property lightSpell auto
bool doOnce = FALSE
ObjectReference Property indicator auto

Event OnActivate(ObjectReference akActionRef)
	if(!doOnce)
		bottomVariable.SetValue(bottomVariable.GetValue() + 1)
		doOnce = TRUE
		indicator.EnableNoWait()
	endif
	lightSpell.Cast(projector, reciever)
EndEvent