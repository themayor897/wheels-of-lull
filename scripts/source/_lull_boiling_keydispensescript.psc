Scriptname _Lull_Boiling_KeyDispenseScript extends ObjectReference  

bool doOnce = false
Key Property keyToDispense auto;

Event OnActivate(ObjectReference akActionRef)
	if(!doOnce)
		Game.GetPlayer().AddItem(keyToDispense, 1)
		doOnce = true
	endif
EndEvent