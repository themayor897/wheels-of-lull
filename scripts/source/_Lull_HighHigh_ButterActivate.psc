Scriptname _Lull_HighHigh_ButterActivate extends ReferenceAlias  Conditional

MiscObject Property shovel auto

_Lull_HighHigh_ButterScript  BUT


Event OnActivate(ObjectReference akActionRef)
	
	BUT = GetOwningQuest() as _Lull_HighHigh_ButterScript

	if(Game.GetPlayer().GetItemCount(shovel) >= 1)
		BUT.ButterCount()
		TryToDisableNoWait()
	else
		Debug.MessageBox("Looks like you'll need a shovel to scoop away this butter.")		
	endif
EndEvent 