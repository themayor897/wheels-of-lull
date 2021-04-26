Scriptname _Lull_SQ_WatchmanScript1 extends ObjectReference  

;Modified 4.25.21 by themayor897. Converted messagebox strings to message records, switched getplayer calls to playerref, added logging functions.

MiscObject Property IngotGold auto
MiscObject Property DwarvenCog auto
MiscObject Property DwarvenGear auto
ObjectReference Property rod1 auto
ObjectReference Property rod2 auto
ObjectReference Property rod3 auto
ObjectReference Property rod4 auto
Quest Property watchmanRestore auto
Message Property WatchmanRecipe auto
Message Property WatchmanNeedMaterials auto
Actor Property PlayerRef auto
Event OnActivate(ObjectReference akActionRef)
	if(watchmanRestore.GetStage() == 0)
		watchmanRestore.SetStage(1)
		WatchmanRecipe.show()
		watchmanRestore.SetObjectiveDisplayed(1)
	elseif(watchmanRestore.GetStage() == 1)
		if (PlayerRef.GetItemCount(IngotGold) >= 3 &&  PlayerRef.GetItemCount(DwarvenCog) >= 5 && PlayerRef.GetItemCount(DwarvenGear) >= 5)
			PlayerRef.RemoveItem(IngotGold, 3)
			PlayerRef.RemoveItem(DwarvenCog , 5)
			PlayerRef.RemoveItem(DwarvenGear , 5)
			watchmanRestore.SetStage(2)
			watchmanRestore.SetObjectiveCompleted(1)
			watchmanRestore.SetObjectiveDisplayed(2)		
			rod1.EnableNoWait()
			rod2.EnableNoWait()	
			rod3.EnableNoWait()	
			rod4.EnableNoWait()
			WoL.Log(self, "Watchman repaired, advancing to activation stage.")
		else
			WatchmanNeedMaterials.show()
			WoL.Log(self, "Player tried to activate watchman without enough materials.")
		endif
	endif
EndEvent