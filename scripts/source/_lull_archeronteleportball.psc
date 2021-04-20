Scriptname _Lull_ArcheronTeleportBall extends ObjectReference  
ObjectReference Property archeronTeleport auto
ObjectReference Property lullTeleport auto
ObjectReference Property PlayerRef auto
Quest Property archeronsMines auto
Cell Property cellMine1 auto
Cell Property cellMine2 auto
Cell Property cellMine3 auto
Activator Property teleportFX auto
Message Property teleportballmsg auto


Event OnEquipped(Actor akActor)
  if(PlayerRef.GetParentCell() == cellMine1 || PlayerRef.GetParentCell() == cellMine2 || PlayerRef.GetParentCell() == cellMine3)
		PlayerRef.PlaceAtMe(teleportFX)
		Utility.Wait(3)
		PlayerRef.MoveTo(lullTeleport)
		WoL.Log(self, "Sending player back to Lull-Mor...")
		if(archeronsMines.IsObjectiveDisplayed(7))
			archeronsMines.setStage(8)
		endif
  else
		if(!archeronsMines.IsCompleted())
			int bCurrentStage = archeronsMines.getstage()
			if bCurrentStage == 2
				archeronsMines.SetObjectiveCompleted(2)
				archeronsMines.setStage(5)
				archeronsMines.SetObjectiveDisplayed(5)
				archeronsMines.SetObjectiveDisplayed(6)
				WoL.Log(self, "Sending player to mines for the first time...")
			endif
			if bCurrentStage >= 2
				PlayerRef.PlaceAtMe(teleportFX)
				Utility.Wait(3)
				PlayerRef.MoveTo(archeronTeleport)
				WoL.Log(self, "Sending player to mines...")
			endIf
			if bCurrentStage == 1
				teleportballmsg.show()
			endIf
		endif
  endIf
endEvent