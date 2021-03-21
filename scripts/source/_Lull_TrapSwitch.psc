Scriptname _Lull_TrapSwitch extends ObjectReference  

ObjectReference[] Property _lull_piston Auto
FormList Property CellPistons Auto
ObjectReference Property PistonParent Auto


Event OnActivate(ObjectReference akActionRef)
    int handle = ModEvent.Create("_Lull_FoundryOffSwitch")
    if (handle)
        ModEvent.PushForm(handle, self)
        ModEvent.Send(handle)
		;debug.trace("Wheels of Lull: Foundry off Switch Event Sent")
    endIf
	Int iIndex = CellPistons.GetSize()
	While iIndex
		iIndex -= 1
		ObjectReference kReference = CellPistons.GetAt(iIndex) As ObjectReference
		kReference.PlayAnimationAndWait("Down", "TransDown")
		kReference.goToState("Reset")
	EndWhile
	If PistonParent.IsDisabled()
		PistonParent.Enable(false)
	Else
		PistonParent.Disable(false)
	Endif
EndEvent 