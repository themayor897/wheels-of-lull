Scriptname _Lull_ResevoirScript extends ObjectReference  

ObjectReference Property magic1 auto
ObjectReference Property magic2 auto
ObjectReference Property magic3 auto
ObjectReference Property magic4 auto
ObjectReference Property magic5 auto
ObjectReference Property waterMagic auto
ObjectReference Property waterMarker auto
ObjectReference Property KillTriggerSwap auto
Quest Property archeronMines auto
Sound Property waterSound auto
bool doOnce = false

Event OnActivate(ObjectReference akActionRef)
	if(!doOnce )
		archeronMines.SetObjectiveCompleted(6)
		if(archeronMines.IsObjectiveCompleted(5))
			archeronMines.setstage(7)
			archeronMines.SetObjectiveDisplayed(7)
		endif
		magic1.DisableNoWait()
		magic2.DisableNoWait()
		magic3.DisableNoWait()
		magic4.DisableNoWait()
		magic5.DisableNoWait()
		waterMagic.TranslateToRef(waterMarker, 200)
		Game.ShakeCamera()
		waterSound.Play(Game.GetPlayer())
		KillTriggerSwap.DisableNoWait()
		doOnce = true
	endif
EndEvent