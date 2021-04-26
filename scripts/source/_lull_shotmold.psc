Scriptname _Lull_Shotmold extends ObjectReference  

Ammo Property clockworkShots auto
MiscObject Property ingotGold auto
Message Property _Lull_ShotmoldNeed auto
Actor Property PlayerRef auto

Event OnEquipped(Actor akActor)
	if(PlayerRef.GetItemCount(ingotGold) >= 1)
		PlayerRef.AddItem(clockworkShots, 3)
		PlayerRef.RemoveItem(ingotGold, 1)
	else
		_Lull_ShotmoldNeed.Show()
	endif
EndEvent