Scriptname _Lull_CavePitScript extends ObjectReference  

Keyword Property lull_isMutant auto
Sound Property deathSound auto

Event OnTriggerEnter(ObjectReference akActionRef)
	if(akActionRef == Game.GetPlayer())
		Game.GetPlayer().Kill()
	endif
	if(akActionRef.HasKeyword(lull_isMutant))
		akActionRef.DisableNoWait(1)
		deathSound.Play(Game.GetPlayer())
	endif
EndEvent