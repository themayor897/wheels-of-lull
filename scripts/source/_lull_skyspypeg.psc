Scriptname _Lull_SkySpyPeg extends ObjectReference  

Sound Property installSound auto
Weapon Property triangulator auto
Quest Property MQ02 auto
Int Property questObjective auto
bool Property isAnalyst auto
int numHits = 0;
Static Property pillarOfLight auto
Message property _Lull_AnalystBlock auto
Actor Property PlayerRef auto

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	Weapon akWeapon = akSource as Weapon
	if(akWeapon == triangulator)
		numHits += 1
		if(numHits == 3)
			if(!isAnalyst)
				MQ02.SetObjectiveCompleted(questObjective)
				installSound.Play(PlayerRef)
				self.PlaceAtMe(pillarOfLight)
			else
				if(!MQ02.IsObjectiveCompleted(25))
					_Lull_AnalystBlock.show()
					numHits = 0
				else
					MQ02.SetObjectiveCompleted(questObjective)
					installSound.Play(PlayerRef)
					self.PlaceAtMe(pillarOfLight)
				endif
			endif
			if(MQ02.IsObjectiveCompleted(20) && MQ02.IsObjectiveCompleted(21) && MQ02.IsObjectiveCompleted(22))
				MQ02.SetObjectiveDisplayed(30)
				MQ02.SetStage(30)
			endif
		endif
	endif
EndEvent