Scriptname _Lull_SQ_LullMorTeleportScript extends ObjectReference  

ObjectReference Property lullMorMarker auto
Activator Property teleportFX auto

Event OnEquipped(Actor akActor)
	Game.GetPlayer().PlaceAtMe(teleportFX)
	Utility.Wait(3)
	Game.GetPlayer().MoveTo(lullMorMarker)
EndEvent