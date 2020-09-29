Scriptname _Lull_MQ01_TakeStone extends ObjectReference  

Import Utility 

actor Property _Lull_Actor_Llavados Auto

MiscObject Property llavPneuma auto
Quest Property _lull_MQ01 auto
Topic Property stoneHoleMine auto
TalkingActivator Property xMarkerActivator auto
ObjectReference Property ActorToSpeakLll auto
Scene Property lullExplainScene auto

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	MiscObject akMisc = akBaseItem as MiscObject
	if(akMisc == llavPneuma)
		ActorToSpeakLll.MoveTo(self)
		_lull_MQ01.SetObjectiveCompleted(10)
		lullExplainScene.Start()
		waitgametime(12)
		if (_Lull_MQ01.GetStage() == 20) 
			_Lull_Actor_Llavados.MoveToMyEditorLocation()
		endif
	endif
EndEvent