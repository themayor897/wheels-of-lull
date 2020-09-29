Scriptname _Lull_GateSwitch extends ObjectReference  

GlobalVariable Property lull_gate1 auto
GlobalVariable Property lull_gate2 auto
GlobalVariable Property lull_gate3 auto
GlobalVariable Property lull_gate4 auto
GlobalVariable Property lull_gate5 auto
GlobalVariable Property lull_Destination auto
ObjectReference Property mainGate auto
ObjectReference Property gateBeam auto
Sound Property gateOnline auto
float totalGates
float  randomLocation
Event OnActivate(ObjectReference akActionRef)
	totalGates = (lull_gate1.GetValue() + lull_gate2.GetValue() + lull_gate3.GetValue() + lull_gate4.GetValue() + lull_gate5.GetValue())
	findLocation()
EndEvent


Function findLocation()
	randomLocation = Utility.RandomFloat(1, totalGates)
	if(randomLocation == 1)
		if(lull_gate1.GetValue() == 1)
			lull_Destination.SetValue(1)
		elseif(lull_gate2.GetValue() == 1)
			lull_Destination.SetValue(2)
		elseif(lull_gate3.GetValue() == 1)
			lull_Destination.SetValue(3)
		elseif(lull_gate4.GetValue() == 1)
			lull_Destination.SetValue(4)
		elseif(lull_gate5.GetValue() == 1)
			lull_Destination.SetValue(5)
		endif
	elseif(randomLocation == 2)
		if(lull_gate2.GetValue() == 1)
			lull_Destination.SetValue(2)
		elseif(lull_gate1.GetValue() == 1)
			lull_Destination.SetValue(1)
		elseif(lull_gate3.GetValue() == 1)
			lull_Destination.SetValue(3)
		elseif(lull_gate4.GetValue() == 1)
			lull_Destination.SetValue(4)
		elseif(lull_gate5.GetValue() == 1)
			lull_Destination.SetValue(5)
		endif
	elseif(randomLocation == 3)
		if(lull_gate3.GetValue() == 1)
			lull_Destination.SetValue(3)
		elseif(lull_gate1.GetValue() == 1)
			lull_Destination.SetValue(1)
		elseif(lull_gate2.GetValue() == 1)
			lull_Destination.SetValue(2)
		elseif(lull_gate4.GetValue() == 1)
			lull_Destination.SetValue(4)
		elseif(lull_gate5.GetValue() == 1)
			lull_Destination.SetValue(5)
		endif
	elseif(randomLocation == 4)
		if(lull_gate4.GetValue() == 1)
			lull_Destination.SetValue(4)
		elseif(lull_gate1.GetValue() == 1)
			lull_Destination.SetValue(1)
		elseif(lull_gate2.GetValue() == 1)
			lull_Destination.SetValue(2)
		elseif(lull_gate3.GetValue() == 1)
			lull_Destination.SetValue(3)
		elseif(lull_gate5.GetValue() == 1)
			lull_Destination.SetValue(5)
		endif
	elseif(randomLocation == 5)
		if(lull_gate5.GetValue() == 1)
			lull_Destination.SetValue(5)
		elseif(lull_gate1.GetValue() == 1)
			lull_Destination.SetValue(1)
		elseif(lull_gate2.GetValue() == 1)
			lull_Destination.SetValue(2)
		elseif(lull_gate3.GetValue() == 1)
			lull_Destination.SetValue(3)
		elseif(lull_gate4.GetValue() == 1)
			lull_Destination.SetValue(4)
		endif
	endif
	mainGate.EnableNoWait()
	gateBeam.EnableNoWait()
	gateOnline.Play(Game.GetPlayer())
	Game.ShakeCamera()
EndFunction


