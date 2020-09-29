Scriptname _Lull_Stonehole_ScenemarkerScript extends ObjectReference  

ObjectReference Property llavadosTalker auto
bool doOnce = FALSE
Scene Property lineToSay auto

Event OnTriggerEnter(ObjectReference akActionRef)
	if(akActionRef == Game.GetPlayer())
		if(!doOnce)
			llavadosTalker.MoveTo(Game.GetPlayer())
			lineToSay.Start()
			doOnce = TRUE
		endif
	endif
EndEvent