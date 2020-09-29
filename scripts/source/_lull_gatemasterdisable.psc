Scriptname _Lull_GateMasterDisable extends ObjectReference  

GlobalVariable Property lull_gateTarget auto
ObjectReference Property mainGate auto
ObjectReference Property whiteHornGate auto
ObjectReference Property beamGate auto
Quest Property mq03 auto

Event OnCellAttach()
	mainGate.DisableNoWait()
	beamGate.DisableNoWait()
	if(mq03.GetStage() >= 60)
		whiteHornGate.DisableNoWait()
	endif
	lull_gateTarget.SetValue(0)
EndEvent