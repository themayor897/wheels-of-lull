Scriptname _Lull_Cave_MachineScript extends ObjectReference  

MiscObject Property battery auto
MiscObject Property drillBit auto
ObjectReference Property drillLaser auto
ObjectReference Property drillWall auto
Sound Property drillingSound auto
Spell Property effectSpell auto
Event OnActivate(ObjectReference akActionRef)
	if(Game.GetPlayer().GetItemCount(battery) < 1 || Game.GetPlayer().GetItemCount(drillBit) < 1)
		Debug.MessageBox("The machine has been partially disabled. It looks like you'll need some sort of power source, as well as the titanium drill.")
	elseif(Game.GetPlayer().GetItemCount(battery) >= 1 &&  Game.GetPlayer().GetItemCount(drillBit) >=1)
		Game.GetPlayer().RemoveItem(drillBit, 1)
		Game.GetPlayer().RemoveItem(battery, 1)	
		drillingSound.Play(Game.GetPlayer())
		drillLaser.EnableNoWait()
		Utility.Wait(2)
		drillWall.DisableNoWait()
		effectSpell.Cast(drillWall, Game.GetPlayer())
	endif
EndEvent