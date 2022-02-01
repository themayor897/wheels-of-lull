Scriptname _Lull_TramScript extends ObjectReference  

;modified 4.25.21 by themayor897. GetPlayer>PlayerRef, Debug.Messagebox>message.Show()


ObjectReference Property travelTo auto
ObjectReference Property insideCart auto
ObjectReference Property tramPlatform auto
bool doOnce = false
bool Property isMover auto
Quest Property cartRide auto
Message Property _Lull_TramBoard auto
Actor Property PlayerRef auto


Event OnLoad()
	if(!doOnce)
		if(isMover)
			self.TranslateToRef(travelTo, 1300)
			doOnce = true
		endif
	endif
EndEvent

Event OnActivate(ObjectReference akActionRef)
	if(cartRide.GetStage() >= 4)
		PlayerRef.MoveTo(tramPlatform)
		_Lull_TramBoard.show()
	else
		PlayerRef.MoveTo(insideCart)
		_Lull_TramBoard.show()
	endif
EndEvent 