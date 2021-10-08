Scriptname _Lull_SothaEhnSwap extends ObjectReference  

Actor Property PlayerRef Auto
Weapon Property DummyBells Auto
Weapon Property RealBells Auto

Event OnContainerChanged(ObjectReference akNew, ObjectReference akOld)
	If akNew == PlayerRef
		PlayerRef.RemoveItem(DummyBells, 1, True)
		PlayerRef.AddItem(RealBells, 1, True)
	EndIf
EndEvent