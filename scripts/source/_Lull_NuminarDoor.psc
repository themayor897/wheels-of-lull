Scriptname _Lull_NuminarDoor extends ObjectReference  

Quest Property MQ02 Auto

Event OnCellAttach()

	If !MQ02.IsStageDone(4)
		self.setlocklevel(255)
	endif
	
endevent
