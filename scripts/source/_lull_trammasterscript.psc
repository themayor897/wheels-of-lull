Scriptname _lull_tramMasterScript extends ObjectReference  
Sound Property stopSound auto
ObjectReference Property cartWright auto

Event OnLoad()
	Utility.Wait(4)
	Game.ShakeCamera()
	Debug.MessageBox("The tram stops.")
	stopSound.Play(Game.GetPlayer())
	cartWright.EnableNoWait()
EndEvent