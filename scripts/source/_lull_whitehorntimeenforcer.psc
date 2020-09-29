Scriptname _Lull_WhitehornTimeEnforcer extends ObjectReference  
;Just try and change the time of day fuckers.

GlobalVariable Property gameHour auto

Event OnCellAttach()
	RegisterForSingleUpdate(1)
EndEvent

Event OnUpdate()
	if(gameHour.GetValue() != 2)
		gameHour.SetValue(2)
	endif
EndEvent

Event OnCellDetach()
	UnregisterForUpdate()
EndEvent