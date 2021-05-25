Scriptname _Lull_MerHighTriggerScript extends ObjectReference  

Quest Property MQ03 auto
Sound Property alarmSound auto
ObjectReference Property lullMove auto
Actor Property archeron auto
Actor Property masscroft auto
ObjectReference Property archerMove auto
ObjectReference Property massMove auto
ObjectReference Property lightBulb auto
ObjectReference Property chestThings auto
Int Property stage03 auto
Armor Property thalmorRobes auto
bool property doOnce = True auto

Faction Property WhitehornThalmor auto

auto STATE waitingforPlayer
	Event OnTriggerEnter(ObjectReference akActionRef)
		if(akActionRef == Game.GetPlayer())
			Game.DisablePlayerControls()
			alarmSound.Play(Game.GetPlayer())
			lightBulb.EnableNoWait(1)
			Utility.Wait(3)
			Game.GetPlayer().RemoveItem(thalmorRobes)
			;Game.GetPlayer().RemoveAllItems(chestThings)
			;Game.GetPlayer().MoveTo(lullMove)
			WhitehornThalmor.SendPlayertoJail()			
			archeron.MoveTo(archerMove)
			masscroft.MoveTo(massMove)
			MQ03.SetStage(stage03)
			archeron.EvaluatePackage()
			masscroft.EvaluatePackage()
			Game.EnablePlayerControls()
			
			if doOnce
				gotoState("hasBeenTriggered")
			endif
		
			Disable()
		
		endif
	EndEvent
EndState

STATE hasBeenTriggered
	; this is an empty state.
endSTATE 