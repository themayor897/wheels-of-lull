Scriptname _Lull_SQ_WatchmanScript1 extends ObjectReference  
MiscObject Property IngotGold auto
MiscObject Property DwarvenCog auto
MiscObject Property DwarvenGear auto
ObjectReference Property rod1 auto
ObjectReference Property rod2 auto
ObjectReference Property rod3 auto
ObjectReference Property rod4 auto
Quest Property watchmanRestore auto
Event OnActivate(ObjectReference akActionRef)
	if(watchmanRestore.GetStage() == 0)
		watchmanRestore.SetStage(1)
		Debug.MessageBox("Looking at the suit, you think you might be able to get it working again. You'd need three gold ingots, five dwarven cogs, and five dwarven gears, but once in, perhaps it would work.")
		watchmanRestore.SetObjectiveDisplayed(1)
	elseif(watchmanRestore.GetStage() == 1)
		if (Game.GetPlayer().GetItemCount(IngotGold) >= 3 &&  Game.GetPlayer().GetItemCount(DwarvenCog) >= 5 && Game.GetPlayer().GetItemCount(DwarvenGear) >= 5)
			Game.GetPlayer().RemoveItem(IngotGold, 3)
			Game.GetPlayer().RemoveItem(DwarvenCog , 5)
			Game.GetPlayer().RemoveItem(DwarvenGear , 5)
			watchmanRestore.SetStage(2)
			watchmanRestore.SetObjectiveCompleted(1)
			watchmanRestore.SetObjectiveDisplayed(2)		
			rod1.EnableNoWait()
			rod2.EnableNoWait()	
			rod3.EnableNoWait()	
			rod4.EnableNoWait()	
		else
			Debug.MessageBox("You still need more material to repair the suit.")
		endif
	endif
EndEvent