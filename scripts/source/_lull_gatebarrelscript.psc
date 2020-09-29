Scriptname _Lull_GateBarrelScript extends ObjectReference  
;Variables
GlobalVariable Property lull_gate1 auto
GlobalVariable Property lull_gate2 auto
GlobalVariable Property lull_gate3 auto
GlobalVariable Property lull_gate4 auto
GlobalVariable Property lull_gate5 auto

;Address Modules
MiscObject Property lull_AddressModule1 auto
MiscObject Property lull_AddressModule2 auto
MiscObject Property lull_AddressModule3 auto
MiscObject Property lull_AddressModule4 auto
MiscObject Property lull_AddressModule5 auto

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	if(akBaseItem ==  lull_AddressModule1)
		 lull_gate1.SetValue(1)
	endif
	if(akBaseItem ==  lull_AddressModule2)
		 lull_gate2.SetValue(1)
	endif
	if(akBaseItem ==  lull_AddressModule3)
		 lull_gate3.SetValue(1)
	endif
	if(akBaseItem ==  lull_AddressModule4)
		 lull_gate4.SetValue(1)
	endif
	if(akBaseItem ==  lull_AddressModule5)
		 lull_gate5.SetValue(1)
	endif
EndEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	if(akBaseItem ==  lull_AddressModule1)
		 lull_gate1.SetValue(0)
	endif
	if(akBaseItem ==  lull_AddressModule2)
		 lull_gate2.SetValue(0)
	endif
	if(akBaseItem ==  lull_AddressModule3)
		 lull_gate3.SetValue(0)
	endif
	if(akBaseItem ==  lull_AddressModule4)
		 lull_gate4.SetValue(0)
	endif
	if(akBaseItem ==  lull_AddressModule5)
		 lull_gate5.SetValue(0)
	endif
EndEvent