Scriptname _Lull_HighHigh_ButterActivate extends ReferenceAlias  Conditional

MiscObject Property shovel auto
Message Property _Lull_NeedShovel auto
Actor Property PlayerRef auto

_Lull_HighHigh_ButterScript  BUT


Event OnActivate(ObjectReference akActionRef)
	
	BUT = GetOwningQuest() as _Lull_HighHigh_ButterScript

	if(PlayerRef.GetItemCount(shovel) >= 1)
		BUT.ButterCount()
		TryToDisableNoWait()
	else
		_Lull_NeedShovel.Show()		
	endif
EndEvent 