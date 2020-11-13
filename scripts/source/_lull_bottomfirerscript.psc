Scriptname _Lull_BottomFirerScript extends ObjectReference  

Spell Property lightSpell auto
ObjectReference Property target auto

Event OnCellAttach()
	RegisterForSingleUpdate(2)
EndEvent

Event OnCellDetach()
	UnregisterForUpdate()
EndEvent

Event OnUpdate()
	If (Is3DLoaded())
		lightSpell.Cast(self, target)
	EndIf
		RegisterForSingleUpdate(2)
EndEvent