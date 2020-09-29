Scriptname _lull_RamonMaserScript extends ObjectReference  

;Master things
ObjectReference Property ramonSkull auto
ObjectReference Property ramonHandL auto
ObjectReference Property ramonHandR auto
;Marker 1 is the initial fly to marker
;Skull movement markers
ObjectReference Property ramonSkullMarker1 auto
ObjectReference Property ramonSkullMarker2 auto
ObjectReference Property ramonSkullMarker3 auto

;Left hand markers
ObjectReference Property ramonHandLMarker1 auto
ObjectReference Property ramonHandLMarker2 auto
ObjectReference Property ramonHandLMarker3 auto

;Right hand markers
ObjectReference Property ramonHandRMarker1 auto
ObjectReference Property ramonHandRMarker2 auto
ObjectReference Property ramonHandRMarker3 auto

;Speaker
Topic Property archeronTaunt auto
Actor Property asArcheron auto
Actor Property numinar auto
ObjectReference Property numinarMarker auto


Event OnCellAttach()
	Game.DisablePlayerControls()
	Utility.Wait(2)
	self.Say(archeronTaunt, asArcheron, true)
	numinar.MoveTo(numinarMarker)
	ramonSkull.EnableNoWait()
	ramonHandL.EnableNoWait()
	ramonHandR.EnableNoWait()
	Game.ShakeCamera(Game.GetPlayer(), 0.75, 20)
EndEvent