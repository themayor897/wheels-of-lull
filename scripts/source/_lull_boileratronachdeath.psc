Scriptname _Lull_BoilerAtronachDeath extends ObjectReference  

ObjectReference Property steam1 auto
ObjectReference Property lava1 auto
ObjectReference Property steam2 auto
ObjectReference Property steam3 auto
ObjectReference Property steam4 auto
ObjectReference Property steam5 auto
ObjectReference Property steam6 auto
ObjectReference Property steam7 auto
ObjectReference Property steam8 auto
ObjectReference Property steam9 auto
Quest Property archeronMine auto
Actor Property fireAtronach auto

Event OnLoad()
	fireAtronach.SetDontMove()
EndEvent

Event OnDeath(Actor akKiller)
	steam1.DisableNoWait()
	steam2.DisableNoWait()
	steam3.DisableNoWait()
	steam4.DisableNoWait()
	steam5.DisableNoWait()
	steam6.DisableNoWait()
	steam7.DisableNoWait()
	steam8.DisableNoWait()
	steam9.DisableNoWait()
	archeronMine.SetObjectiveCompleted(5)
	if(archeronMine.IsObjectiveCompleted(6))
		archeronMine.SetStage(7)
		archeronMine.SetObjectiveDisplayed(7)
	endif
	lava1.DisableNoWait(1)
EndEvent


