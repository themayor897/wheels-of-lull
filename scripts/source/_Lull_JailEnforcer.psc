Scriptname _Lull_JailEnforcer extends ObjectReference  
{Used for the MQ03 and MQ06 jail events. Prevents players from "conjuring" a bed while in jail using another mod and breaking the quest. Basically a conditional teleport script.}

Quest Property myQuest Auto
Int Property myStageStart Auto
Int Property myStageEnd Auto 
Actor Property PlayerRef Auto
ObjectReference Property DungeonStart Auto
Bool Property RemoveItems = FALSE Auto
;Specific to Mer in the High Castle
ObjectReference Property Chest Auto
Armor Property Pinger Auto


Event OnTriggerEnter(ObjectReference akActionRef)

	If akActionRef == PlayerRef
		If (myQuest.Getstage() >= myStageStart) && (myQuest.Getstage() <= myStageEnd)
			PlayerRef.MoveTo(DungeonStart)
			WoL.Log(self, "Player attempted to serve quest-required jail sentance by sleeping in a spawned bed! Returning to dungeon...", 1)
			if RemoveItems
				PlayerRef.RemoveItem(Pinger)
				PlayerRef.RemoveAllItems(Chest)
				PlayerRef.AddItem(Pinger)
			endif
		EndIf
	EndIf

EndEvent

		