Scriptname _Lull_SQWaterBottleScript extends ObjectReference  

MiscObject Property waterBottleFilled auto
Potion Property filledBottle auto
bool Property isRefillable auto

Event OnEquipped(Actor akActor)

		RegisterForAnimationEvent(Game.GetPlayer(), "SoundPlay.FSTSwimSwim")
EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
		Debug.MessageBox("You fill up the water bottle.")
		Game.GetPlayer().RemoveItem(self, 1)
		if(isRefillable)
			Game.GetPlayer().AddItem(filledBottle, 1)
		else
			Game.GetPlayer().AddItem(waterBottleFilled, 1)
		endif
		UnregisterForAnimationEvent(Game.GetPlayer(), "SoundPlay.FSTSwimSwim")
EndEvent