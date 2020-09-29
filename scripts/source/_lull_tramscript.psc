Scriptname _Lull_TramScript extends ObjectReference  
ObjectReference Property travelTo auto
ObjectReference Property insideCart auto
ObjectReference Property tramPlatform auto
bool doOnce = false
bool Property isMover auto
Quest Property cartRide auto
Event OnLoad()
	if(!doOnce)
		if(isMover)
			self.TranslateToRef(travelTo, 1300)
			doOnce = true
		endif
	endif
EndEvent

Event OnActivate(ObjectReference akActionRef)
	if(cartRide.GetStage() >= 20)
		Game.GetPlayer().MoveTo(tramPlatform)
		Debug.MessageBox("You board the tram.")
	else
		Game.GetPlayer().MoveTo(insideCart)
		Debug.MessageBox("You board the tram.")
	endif
EndEvent