Scriptname _Lull_Boiling_getbit extends ObjectReference  
MiscObject Property drillBit auto
Quest Property MQ04 auto
ObjectReference Property doorMarker1 auto
ObjectReference Property guardsActivate auto
ObjectReference Property bitModel auto
ObjectReference Property blackFRF auto
ObjectReference Property blueFRF auto
Event OnActivate(ObjectReference akActivator)
	Game.GetPlayer().AddItem(drillBit, 1)
	doorMarker1.DisableNoWait(1) 
	blackFRF.EnableNoWait()
	blueFRF.EnableNoWait()
	guardsActivate.EnableNoWait(1) 
	MQ04.SetStage(30)
	MQ04.SetObjectiveDisplayed(30)
	MQ04.SetObjectiveCompleted(20)
	self.DisableNoWait(1)
	bitModel.DisableNoWait(1)
EndEvent