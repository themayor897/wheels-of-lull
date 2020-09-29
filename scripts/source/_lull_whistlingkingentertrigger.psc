Scriptname _Lull_WhistlingKingEnterTrigger extends ObjectReference  

Actor Property whistlingKing auto
GlobalVariable Property kingVariable auto

Event OnTriggerEnter(ObjectReference akActionRef)
	if(akActionRef == whistlingKing)
		kingVariable.SetValue(1)
	endif
EndEvent


Event OnTriggerLeave(ObjectReference akActionRef)
	if(akActionRef == whistlingKing)
		kingVariable.SetValue(0)
	endif
EndEvent