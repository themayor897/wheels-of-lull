Scriptname _lull_tramMasterScript extends ObjectReference  

;modified 4.25.21 by themayor897 - added logging, swapped out getplayer call, added message property instead of debug string


Sound Property stopSound auto
ObjectReference Property cartWright auto
Message Property _Lull_TramStops auto
Actor Property PlayerRef auto


Event OnLoad()
	Utility.Wait(4)
	Game.ShakeCamera()
	_Lull_TramStops.show()
	stopSound.Play(PlayerRef)
	cartWright.EnableNoWait()
	WoL.Log(self, "Tram loaded")
EndEvent