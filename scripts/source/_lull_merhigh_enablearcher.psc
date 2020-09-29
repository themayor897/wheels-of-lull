Scriptname _Lull_MerHigh_EnableArcher extends ObjectReference  
Actor Property archeron auto
Actor Property massCroft auto
ObjectReference Property massMarker auto
ObjectReference Property archerMarker auto
Topic Property archeronSay auto
bool doOnce = false

Event OnTriggerEnter(ObjectReference akActionRef)
	if(akActionRef == Game.GetPlayer())
		if(!doOnce)
			archeron.MoveTo(archerMarker)
			archeron.EnableNoWait()
			massCroft.MoveTo(massMarker)
			massCroft.EnableNoWait()
			Utility.Wait(2)
			archeron.Say(archeronSay, archeron, true)
			doOnce = true
		endif
	endif
EndEvent