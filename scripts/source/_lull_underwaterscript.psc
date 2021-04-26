Scriptname _Lull_underwaterScript extends ObjectReference  

;modified 4.25.21 by themayor87. Added logging and swapped getplayer call


Light Property playerTorch auto
Armor Property divingHelm auto

Actor Property PlayerRef auto

Event OnCellAttach()
	RegisterForSingleUpdate(0.5)
	WoL.Log(self, "Underwater02 script attached, registered for update")
EndEvent

Event OnCellDetach()
	UnregisterForUpdate()
	WoL.Log(self, "Underwater02 script detached, unregistered for update")
EndEvent

Event OnUpdate()
	RegisterForSingleUpdate(0.5)
	if(!PlayerRef.IsEquipped(divingHelm))
		PlayerRef.Kill()
	endif
	if(PlayerRef.IsEquipped(playerTorch))
		PlayerRef.UnequipItem(playerTorch)
	endif
EndEvent