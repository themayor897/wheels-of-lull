Scriptname _Lull_Bottom_Masspit extends ObjectReference  

Actor Property masscroft auto
Actor Property PlayerRef auto

ObjectReference Property collisionWall auto
ObjectReference Property resetMarker auto
ObjectReference Property grate auto
ObjectReference Property startMarker auto

Armor Property lull_securityPack auto

Sound Property massScream auto
Sound Property massDie auto

GlobalVariable property NumFalls auto
GlobalVariable property TotalFalls auto

MusicType Property massMusic auto

;--------------------

Event OnTriggerEnter(ObjectReference akActionRef)
	if(akActionRef == masscroft)
		if(NumFalls.getvalue() < TotalFalls.getvalue())
			massScream.Play(PlayerRef)
			masscroft.MoveTo(resetMarker)
			NumFalls.Mod(1.0)
			masscroft.StartCombat(PlayerRef)
			WoL.Log(self, "Fall registered on Masscroft." + NumFalls.GetValue() + "/" + TotalFalls.getvalue() + "falls.")
			if masscroft.isDead() && !masscroft.isDisabled()
				WoL.Log(self, "Masscroft died prematurely! Hits:" + NumFalls.GetValue() + ". Resurrecting", 1)
				Masscroft.resurrect()
			endif
		else
			masscroft.DisableNoWait()
			massMusic.Remove()
			massDie.Play(PlayerRef)
			Game.ShakeCamera()
			grate.DisableNoWait()
			collisionWall.DisableNoWait()
			Masscroft.UnregisterForUpdate()
			WoL.Log(self, "Masscroft defeated, the way is open.") 
		endif
	elseif (akActionRef == PlayerRef)
		if PlayerRef.IsEquipped(lull_securityPack)
			PlayerRef.MoveTo(startMarker)
			WoL.Log(self, "Player fell into pit while wearing Security pack. Returning to start marker...")
		else 
			PlayerRef.Kill()
			WoL.Log(self, "Player fell into pit with no security pack! Instant death...")
		endif
	endif

EndEvent 