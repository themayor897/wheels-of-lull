Scriptname _Lull_Bottom_MassEnable extends ObjectReference  

Actor Property masscroft auto
ObjectReference Property grate auto
ObjectReference Property grateEnd auto
ObjectReference Property xMarker auto
bool doOnce = false
Sound Property doorClose auto
Sound Property massCroftAppear auto
MusicType Property massBossMusic auto
Event OnTriggerEnter(ObjectReference akActionRef)
	if(akActionRef == Game.GetPlayer())
	if(!doOnce)
		Game.DisablePlayerControls()
		doorClose.Play(Game.GetPlayer())
		grate.TranslateToRef(grateEnd, 600)
		Utility.Wait(3)
		masscroft.MoveTo(xMarker)
		massCroftAppear.Play(Game.GetPlayer())
		Utility.Wait(4)
		masscroft.StartCombat(Game.GetPlayer())
		Game.EnablePlayerControls()
		massBossMusic.Add()
		doOnce = true
	endif
	endif
EndEvent