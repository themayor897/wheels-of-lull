Scriptname _Lull_Shotmold extends ObjectReference  

Ammo Property clockworkShots auto
MiscObject Property ingotGold auto

Event OnEquipped(Actor akActor)
	if(Game.GetPlayer().GetItemCount(ingotGold) >= 1)
		Game.GetPlayer().AddItem(clockworkShots, 3)
		Game.GetPlayer().RemoveItem(ingotGold, 1)
	else
		Debug.MessageBox("You need a gold ingot to mold into some shots.")
	endif
EndEvent