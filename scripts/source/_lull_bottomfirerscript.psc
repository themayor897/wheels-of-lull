Scriptname _Lull_BottomFirerScript extends ObjectReference  

Spell Property lightSpell auto
ObjectReference Property target auto
ObjectReference Property PlayerRef auto

Event OnCellAttach()
	RegisterForSingleUpdate(2)
EndEvent

Event OnCellDetach()
	UnregisterForUpdate()
EndEvent

Event OnUpdate()
	If (PlayerRef.GetParentCell() == self.GetParentCell())
		lightSpell.Cast(self, target)
		RegisterForSingleUpdate(2)
	Else
		UnregisterForUpdate()
	EndIf
EndEvent