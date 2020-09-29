Scriptname _Lull_Bottom_Masspit extends ObjectReference  

Actor Property masscroft auto
Sound Property massScream auto
Sound Property massDie auto
ObjectReference Property resetMarker auto
int numHits = 0;
ObjectReference Property grate auto
MusicType Property massMusic auto
ObjectReference Property collisionWall auto
Event OnTriggerEnter(ObjectReference akActionRef)
	if(akActionRef == masscroft)
		if(numHits < 5)
			masscroft.MoveTo(resetMarker)
			numHits += 1
			massScream.Play(Game.GetPlayer())
			masscroft.StartCombat(Game.GetPlayer())
		else
			masscroft.DisableNoWait()
			massDie.Play(Game.GetPlayer())
			Game.ShakeCamera()
			massMusic.Remove()
			grate.DisableNoWait()
			collisionWall.DisableNoWait()
		endif
	endif
EndEvent