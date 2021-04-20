Scriptname _Lull_BottomFirerScript extends ObjectReference  

Spell Property lightSpell auto
ObjectReference Property target auto
ObjectReference Property PlayerRef auto

Event OnCellAttach()
	RegisterForSingleUpdate(2)
	WoL.Log(self, "Bottom Firer enabled")
EndEvent

Event OnCellDetach()
	UnregisterForUpdate()
	WoL.Log(self, "Bottom Firer disabled")
EndEvent

Event OnUpdate()
	If (PlayerRef.GetParentCell() == self.GetParentCell())
		lightSpell.Cast(self, target)
		RegisterForSingleUpdate(2)
	Else
		UnregisterForUpdate()
		WoL.Log(self, "Bottom Firer disabled")
	EndIf
EndEvent