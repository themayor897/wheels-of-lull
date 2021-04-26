Scriptname _Lull_MQ01Startup extends Quest  

ObjectReference Property PlayerRef Auto
ObjectReference Property Llavados Auto

Keyword Property pLocTypeHabitation Auto


Event OnUpdate()
	if Llavados.getCurrentLocation().IsSameLocation((PlayerRef.getCurrentLocation()), pLocTypeHabitation)
		WoL.Log(self, "Llavados and player are in same habitation. Initial Stage is continuing to run.")
	else
 		WoL.Log(self, "Llavados and player are not in same habitation. Advancing startup quest.")
		UnregisterForUpdate()
		SetStage(10)
	endif
endEvent 