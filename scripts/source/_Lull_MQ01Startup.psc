Scriptname _Lull_MQ01Startup extends Quest  

ObjectReference Property PlayerRef Auto
ObjectReference Property Llavados Auto

Keyword Property pLocTypeHabitation Auto


Event OnUpdate()
	if Llavados.getCurrentLocation().IsSameLocation((PlayerRef.getCurrentLocation()), pLocTypeHabitation)
; 		debug.trace("WICourierScript: Courier and player are in same habitation. Quest is continuing to run.")
	else
; 		debug.trace("WICourierScript: Courier and player are not in same habitation. Stopping quest.")
		UnregisterForUpdate()
		SetStage(10)
	endif
endEvent 