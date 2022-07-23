Scriptname _Lull_WhistlingKingEnterTrigger extends ObjectReference  

Actor Property whistlingKing auto
GlobalVariable Property kingVariable auto
int inTrigger = 0 
Event OnTriggerEnter(ObjectReference akActionRef)
	if(akActionRef == whistlingKing && inTrigger ==0)
		kingVariable.SetValue(1)
		inTrigger +=1
	endif
EndEvent


Event OnTriggerLeave(ObjectReference akActionRef)
	if(akActionRef == whistlingKing && inTrigger >0)
		kingVariable.SetValue(0)
		inTrigger -=1
	endif
EndEvent