Scriptname _Lull_SQ_UpkeepScreen extends ObjectReference  

;modified 4.25.21 by themayor897. Converted messagebox strings to message records, cleaned up FixThing() function, added logging.


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

Message Property _Lull_Upkeep01 auto
Message Property _Lull_Upkeep02 auto
Message Property _Lull_Upkeep03 auto
Message Property _Lull_Upkeep04 auto

Actor Property PlayerRef auto

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack,  bool abBashAttack, bool abHitBlocked)
	Enchantment akEnchant = akSource as Enchantment
	if(!wasDiagnosed)
		if(akEnchant == upkeepStaff1)
			typeOfProblem = Utility.RandomInt(0, 2)
			if(typeOfProblem == 0)
				_Lull_Upkeep01.show()  ;"The registries are dirty."
				WoL.Log(self, "Dirty registries assigned to monitor")
			elseif(typeOfProblem == 1)
				_Lull_Upkeep02.show()   ;"The system needs to be rebooted."
				WoL.Log(self, "Reboot assigned to monitor")
			elseif(typeOfProblem == 2)
				_Lull_Upkeep03.show()   ;"The nodes are fragmented, and must be restored."
				WoL.Log(self, "Fragmented nodes assigned to monitor")
			endif
			wasDiagnosed = true
		else 
			WoL.Log(self, "Wrong staff used on monitor. Needs diagnosis staff")
		endif
	else
		if(!wasFixed)
			if(akEnchant == upkeepStaff2 && typeOfProblem == 0)
				FixThing()
			elseif(akEnchant == upkeepStaff3 && typeOfProblem == 1)
				FixThing()
			elseif(akEnchant == upkeepStaff4 && typeOfProblem == 2)
				FixThing()
			else
				WoL.Log(self, "Wrong staff used on monitor. Need to use corresponding staff for problem " + (typeOfProblem as string))
			endif
		endif
	endif
EndEvent


Function FixThing()
	wasFixed = true
	upkeepVariable.Mod(1)
	fixSound.Play(PlayerRef)
	_Lull_Upkeep04.show()                   ;"You fix this particular monitor."
	if(upkeepVariable.GetValue() >= 12)
		WoL.Log(self, "All monitors fixed, advancing stage...")
		Upkeep.SetStage(20)
		Upkeep.SetObjectiveCompleted(1)
		Upkeep.SetObjectiveDisplayed(2)
	endif
EndFunction