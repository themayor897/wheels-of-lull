Scriptname _Lull_Forest_BossScriptEnable extends ObjectReference  

MusicType Property ThoMusic auto
ObjectReference Property tho1 auto
ObjectReference Property tho2 auto
ObjectReference Property tho3 auto
ObjectReference Property tho4 auto
ObjectReference Property tho5 auto
ObjectReference Property thoBoss auto
Sound Property thoSummon auto
Spell Property thoCast auto
Sound Property thoAlive auto
bool doOnce = FALSE
Event OnTriggerEnter(ObjectReference akActionRef) 
	if(akActionRef == Game.GetPlayer())
		if(!doOnce)
			Game.DisablePlayerControls()
			thoSummon.Play(Game.GetPlayer())
			tho1.EnableNoWait(1)
			Utility.Wait(2)
			thoCast.Cast(tho1, tho2)
			thoCast.Cast(tho1, tho3)
			thoCast.Cast(tho1, tho4)
			thoCast.Cast(tho1, tho5)
			Utility.Wait(2)
			tho1.DisableNoWait(1)
			tho2.DisableNoWait(1)
			tho3.DisableNoWait(1)
			tho4.DisableNoWait(1)
			tho5.DisableNoWait(1)
			thoAlive.Play(Game.GetPlayer())
			thoBoss.EnableNoWait()
			ThoMusic.Add()
			Game.EnablePlayerControls()
			doOnce = TRUE
		endif
	endif
EndEvent