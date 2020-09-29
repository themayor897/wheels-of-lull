Scriptname _Lull_StoneholeTriggerMaster extends ObjectReference  

ObjectReference Property enabler auto ;Thing to Enable, or thing to move
ObjectReference Property disabler auto  ;Thing to disable, or thing to move towards
Sound Property spookySound auto  ;The spooky sound to play
int Property i_eventType auto  ;The type of event
int Property movementSpeed auto ;The speed of the thing to move
bool doOnce = FALSE

;Universal Trigger script
Event OnTriggerEnter(ObjectReference akActionRef)
if(akActionRef == Game.GetPlayer())
	if(!doOnce)
	;We have things enabled and disabled with sound, we have things enabled and moving towards us (with sound), we have screenshake and sound play.
	if(i_eventType == 1) ;Enabled and disabled 
		enabler.EnableNoWait()
		disabler.DisableNoWait()
		spookySound.Play(Game.GetPlayer())
	elseif(i_eventType == 2);Moving 
		enabler.EnableNoWait()
		Utility.Wait(1)
		enabler.TranslateToRef(disabler, movementSpeed)
		spookySound.Play(Game.GetPlayer())
	elseif(i_eventType == 3);Screenshake
		Game.ShakeCamera()
		spookySound.Play(Game.GetPlayer())
	endif	
	doOnce = TRUE
	endif
endif
EndEvent