Scriptname _Lull_MasscroftCombatScript extends ObjectReference  

ObjectReference Property teleportMarker1 auto
ObjectReference Property teleportMarker2 auto
ObjectReference Property teleportMarker3 auto
ObjectReference Property teleportMarker4 auto
Spell Property invisibleSpell auto
Cell Property bottomCell auto
Actor Property massCroft auto
Activator Property teleporter auto
bool doOnce = FALSE
Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
  if (akTarget == Game.GetPlayer())
	if(self.GetParentCell() == bottomCell)
		if(!doOnce)
			RegisterForSingleUpdate(7)
			doOnce = TRUE
		endif
	endif
 endif
EndEvent


Event OnUpdate()
	int randomNumber = Utility.RandomInt(0, 3)
	invisibleSpell.Cast(self, self)
	if(randomNumber == 0)
		self.PlaceAtMe(teleporter, 1)
		self.MoveTo(teleportMarker1)
		massCroft.Resurrect()
		massCroft.StartCombat(Game.GetPlayer())
		invisibleSpell.Cast(massCroft, massCroft)
	elseif(randomNumber == 1)
		self.PlaceAtMe(teleporter, 1)
		self.MoveTo(teleportMarker2)
		massCroft.Resurrect()
		massCroft.StartCombat(Game.GetPlayer())
		invisibleSpell.Cast(massCroft, massCroft)
	elseif(randomNumber == 2)
		self.PlaceAtMe(teleporter, 1)
		self.MoveTo(teleportMarker3)
		massCroft.Resurrect()
		massCroft.StartCombat(Game.GetPlayer())
		invisibleSpell.Cast(massCroft, massCroft)
	elseif(randomNumber == 3)
		self.PlaceAtMe(teleporter, 1)
		self.MoveTo(teleportMarker4)
		massCroft.Resurrect()
		massCroft.StartCombat(Game.GetPlayer())
		invisibleSpell.Cast(massCroft, massCroft)
	endif
	if(!self.IsDisabled())
		RegisterForSingleUpdate(20)
	endif
EndEvent

