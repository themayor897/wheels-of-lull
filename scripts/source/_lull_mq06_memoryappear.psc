Scriptname _Lull_MQ06_MemoryAppear extends ObjectReference  

Actor Property Memory auto
Quest Property MQ06 auto
ObjectReference Property light1 auto
Sound Property crashSound auto
Sound Property appearSound auto
bool doOnce = false
Event OnCellAttach()
	if(!doOnce)
		Utility.Wait(2)
		crashSound.Play(Game.GetPlayer())
		MQ06.SetObjectiveDisplayed(20)
		Utility.Wait(10)
		Memory.EnableNoWait()
		light1.EnableNoWait()
		appearSound.Play(Game.GetPlayer())
		doOnce = true
	endif
EndEvent