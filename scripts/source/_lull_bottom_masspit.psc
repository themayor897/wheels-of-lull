Scriptname _Lull_Bottom_Masspit extends ObjectReference  

_Lull_masscroftcombatscript  MCS

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
			massScream.Play(Game.GetPlayer())			
			masscroft.MoveTo(resetMarker)
			numHits += 1
			masscroft.StartCombat(Game.GetPlayer())
		else
			masscroft.DisableNoWait()
			MCS.Unregisterforupdate()
			massDie.Play(Game.GetPlayer())
			Game.ShakeCamera()
			massMusic.Remove()
			grate.DisableNoWait()
			collisionWall.DisableNoWait()
		endif
	endif
EndEvent