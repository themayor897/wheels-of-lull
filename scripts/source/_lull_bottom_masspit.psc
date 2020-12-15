Scriptname _Lull_Bottom_Masspit extends ObjectReference  

_Lull_masscroftcombatscript  MCS

Actor Property masscroft auto

ObjectReference Property collisionWall auto
ObjectReference Property resetMarker auto
ObjectReference Property grate auto

Sound Property massScream auto
Sound Property massDie auto

GlobalVariable property NumFalls auto
GlobalVariable property TotalFalls auto

MusicType Property massMusic auto

;--------------------

Event OnTriggerEnter(ObjectReference akActionRef)
	if(akActionRef == masscroft)
		if(NumFalls.getvalue() < TotalFalls.getvalue())
			massScream.Play(Game.GetPlayer())
			masscroft.MoveTo(resetMarker)
			NumFalls.Mod(1.0)
			masscroft.damageav("health", 300)
			masscroft.StartCombat(Game.GetPlayer())
		else
			masscroft.DisableNoWait()
			MCS.Unregisterforupdate()
			massMusic.Remove()
			massDie.Play(Game.GetPlayer())
			Game.ShakeCamera()
			grate.DisableNoWait()
			collisionWall.DisableNoWait()
		endif
	endif
EndEvent