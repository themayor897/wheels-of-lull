Scriptname _Lull_BottomBackupRefs extends ObjectReference  
{Goes on the backup item refs in LullBottom01. Created 9.7.2021 by themayor897}

GlobalVariable Property PickedUpGlobal Auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	PickedUpGlobal.SetValue(1)
	WoL.Log(self, "Bottom of the World backup object reference changed containers.")
EndEvent