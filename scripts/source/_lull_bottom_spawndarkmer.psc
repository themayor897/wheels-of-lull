Scriptname _Lull_Bottom_SpawnDarkMer extends ObjectReference  

ObjectReference Property marker1 auto
ObjectReference Property marker2 auto
ObjectReference Property marker3 auto
ActorBase Property darkMer6 auto
Activator Property summonSpell auto
bool doOnce = FALSE

Event OnTriggerEnter(ObjectReference akActionRef)
	if(!doOnce)
		marker1.PlaceAtme(darkmer6, 1)
		marker1.PlaceAtme(summonSpell, 1)
		marker2.PlaceAtme(darkmer6, 1)
		marker2.PlaceAtme(summonSpell, 1)		
		marker3.PlaceAtme(darkmer6, 1)
		marker3.PlaceAtme(summonSpell, 1)	
		doOnce = TRUE	
	endif
EndEvent