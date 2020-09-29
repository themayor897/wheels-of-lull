Scriptname _Lull_underwaterScript extends ObjectReference  

Light Property playerTorch auto
Armor Property divingHelm auto

Event OnCellAttach()
	RegisterForSingleUpdate(0.5)
EndEvent

Event OnCellDetach()
	UnregisterForUpdate()
EndEvent

Event OnUpdate()
	RegisterForSingleUpdate(0.5)
	if(!Game.GetPlayer().IsEquipped(divingHelm))
		Game.GetPlayer().Kill()
	endif
	if(Game.GetPlayer().IsEquipped(playerTorch))
		Game.GetPlayer().UnequipItem(playerTorch)
	endif
EndEvent