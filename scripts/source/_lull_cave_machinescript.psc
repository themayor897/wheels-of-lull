Scriptname _Lull_Cave_MachineScript extends ObjectReference  

;updated 4.19.21 by themayor897 - added playerref and msg record, logging, swapped lines 29 and 30

MiscObject Property battery auto
MiscObject Property drillBit auto
ObjectReference Property drillLaser auto
ObjectReference Property drillWall auto
Sound Property drillingSound auto
Spell Property effectSpell auto

ObjectReference Property PlayerRef auto
Message Property BrokenMachine auto

Event OnActivate(ObjectReference akActionRef)
	if(PlayerRef.GetItemCount(battery) < 1 || PlayerRef.GetItemCount(drillBit) < 1)
		BrokenMachine.Show()
		if(PlayerRef.GetItemCount(battery) < 1)
			WoL.Log(self, "Player doesn't have the drill power source.")
		elseif (PlayerRef.GetItemCount(drillBit) < 1)
			WoL.Log(self, "Player doesn't have the drillbit")
		endif
	elseif(PlayerRef.GetItemCount(battery) >= 1 &&  PlayerRef.GetItemCount(drillBit) >=1)
		PlayerRef.RemoveItem(drillBit, 1)
		PlayerRef.RemoveItem(battery, 1)	
		drillingSound.Play(PlayerRef)
		drillLaser.EnableNoWait()
		Utility.Wait(2)
		effectSpell.Cast(drillWall, PlayerRef)
		drillWall.DisableNoWait()
		WoL.Log(self, "Drill repaired, wall is gone.")
	endif
EndEvent 