Scriptname _Lull_Stonehole_LineTriggerScript extends ObjectReference  

Actor Property llavados auto
bool doOnce = FALSE
Topic Property lineToSay auto
Activator Property xMarkerActivator auto
Event OnTriggerEnter(ObjectReference akActionRef)
	if(!doOnce)
		ObjectReference xMarker = Game.GetPlayer().PlaceAtMe(xMarkerActivator)
		xMarker.Say(lineToSay, llavados, true)
		doOnce = TRUE
	endif
EndEvent