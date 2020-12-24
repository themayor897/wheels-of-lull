Scriptname _Lull_DarkmerPitAdd extends ObjectReference  

ObjectReference Property Marker1 auto
ActorBase Property Darkmer auto

Event OnTriggerEnter(ObjectReference akActionRef)
	Actor trigActor = (akActionRef as form) as Actor
	if trigActor.getactorbase() == Darkmer
		akActionRef.moveto(Marker1)
	endif
EndEvent