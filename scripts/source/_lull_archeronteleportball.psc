Scriptname _Lull_ArcheronTeleportBall extends ObjectReference  
ObjectReference Property archeronTeleport auto
ObjectReference Property lullTeleport auto
Quest Property archeronsMines auto
Cell Property cellMine1 auto
Cell Property cellMine2 auto
Cell Property cellMine3 auto
Activator Property teleportFX auto
Event OnEquipped(Actor akActor)
  if(Game.GetPlayer().GetParentCell() == cellMine1 || Game.GetPlayer().GetParentCell() == cellMine2 || Game.GetPlayer().GetParentCell() == cellMine3)
		Game.GetPlayer().PlaceAtMe(teleportFX)
		Utility.Wait(3)
		Game.GetPlayer().MoveTo(lullTeleport)
		if(archeronsMines.IsObjectiveDisplayed(7))
			archeronsMines.setStage(7)
			archeronsMines.SetObjectiveCompleted(7)
			archeronsMines.CompleteQuest()
		endif
  else
		if(!archeronsMines.IsCompleted())
			int bCurrentStage = archeronsMines.getstage()
			if bCurrentStage == 2
				archeronsMines.SetObjectiveCompleted(2)
				archeronsMines.setStage(5)
				archeronsMines.SetObjectiveDisplayed(5)
				archeronsMines.SetObjectiveDisplayed(6)
			endif
			if bCurrentStage >= 2
				Game.GetPlayer().PlaceAtMe(teleportFX)
				Utility.Wait(3)
				Game.GetPlayer().MoveTo(archeronTeleport)
			endIf
			if bCurrentStage == 1
				Debug.MessageBox("You should probably read the note that came with the mysterious ball before you try to use it. After the incident with Uncle Sven last year, you should know better than to grab random balls.")
			endIf
		endif
  endIf
endEvent