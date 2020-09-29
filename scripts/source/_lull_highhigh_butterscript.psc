Scriptname _Lull_HighHigh_ButterScript extends ObjectReference  

GlobalVariable Property butterVariable auto
Quest Property lullMQ03 auto
MiscObject Property shovel auto
Int Property numButters auto
Sound Property butterSound auto
Event OnActivate(ObjectReference akActionRef)
	if(Game.GetPlayer().GetItemCount(shovel) >= 1)
		butterVariable.SetValue(butterVariable.GetValue() + 1)
		butterSound.Play(Game.GetPlayer())
		if(butterVariable.GetValue() >= numButters)
			lullMQ03.SetStage(15)
			lullMQ03.SetObjectiveCompleted(10)
			lullMQ03.SetObjectiveDisplayed(15)
		endif
		self.DisableNoWait(1)
	else
		Debug.MessageBox("Looks like you'll need a shovel to scoop away this butter.")		
	endif
EndEvent