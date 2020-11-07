Scriptname _Lull_MQ01_TakeStone extends ObjectReference  

Import Utility 

actor Property _Lull_Actor_Llavados Auto
MiscObject Property llavPneuma auto
Quest Property _lull_MQ01 auto

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	MiscObject akMisc = akBaseItem as MiscObject
	if(akMisc == llavPneuma)
		_lull_MQ01.SetObjectiveCompleted(10)
		_Lull_MQ01.setstage(11)
		waitgametime(12)
		if (_Lull_MQ01.GetStage() == 20) 
			_Lull_Actor_Llavados.MoveToMyEditorLocation()
		endif
	endif
EndEvent