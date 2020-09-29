Scriptname _Lull_SQ_UpkeepScreen extends ObjectReference  

Enchantment Property upkeepStaff1 auto
Enchantment Property upkeepStaff2 auto
Enchantment Property upkeepStaff3 auto
Enchantment Property upkeepStaff4 auto
bool wasDiagnosed = false;
bool wasFixed = false;
int typeOfProblem;
Quest Property Upkeep auto
GlobalVariable Property upkeepVariable auto
Sound Property fixSound auto

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack,  bool abBashAttack, bool abHitBlocked)
	Enchantment akEnchant = akSource as Enchantment
	if(!wasDiagnosed)
		if(akEnchant == upkeepStaff1)
			typeOfProblem = Utility.RandomInt(0, 2)
			if(typeOfProblem == 0)
				Debug.MessageBox("The registries are dirty.")
			elseif(typeOfProblem == 1)
				Debug.MessageBox("The system needs to be rebooted.")
			elseif(typeOfProblem == 2)
				Debug.MessageBox("The nodes are fragmented, and must be restored.")
			endif
			wasDiagnosed = true
		endif
	else
		if(!wasFixed)
			if(akEnchant == upkeepStaff2 && typeOfProblem == 0)
				FixThing()
			elseif(akEnchant == upkeepStaff3 && typeOfProblem == 1)
				FixThing()
			elseif(akEnchant == upkeepStaff4 && typeOfProblem == 2)
				FixThing()
			endif
		endif
	endif
EndEvent


Function FixThing()
	wasFixed = true
	upkeepVariable.SetValue(upkeepVariable.GetValue() + 1)
	if(upkeepVariable.GetValue() >= 12)
		Upkeep.SetStage(20)
		Upkeep.SetObjectiveCompleted(1)
		Upkeep.SetObjectiveDisplayed(2)
	endif
	fixSound.Play(Game.GetPlayer())
	Debug.MessageBox("You fix this particular monitor.")
EndFunction