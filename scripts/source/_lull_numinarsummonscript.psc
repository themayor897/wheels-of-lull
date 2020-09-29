Scriptname _Lull_NuminarSummonScript extends ObjectReference  
Actor Property numinar auto
ObjectReference Property numinarMarker auto
Quest Property MQ07 auto
bool doOnce = false
Event OnCellAttach()
	if(MQ07.IsCompleted())
		if(!doOnce)
			doOnce = true
			Utility.Wait(3)
			;numinar.MoveTo(numinarMarker)
		endif
	endif
EndEvent