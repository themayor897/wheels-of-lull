Scriptname _Lull_Boiling_BossPit extends ObjectReference  

Actor Property bossEnemy auto
ObjectReference Property reward auto
ObjectReference Property wallBall auto
Sound Property bossScream auto
Sound Property bossDie auto
Spell Property effectSpell auto
GlobalVariable property NumFalls auto
GlobalVariable property TotalFalls auto
MusicType Property minibossMusic auto
bool doOnce = FALSE
float HitDamage
float total
float hits

Event OnTriggerEnter(ObjectReference akActionRef)
	if(akActionRef == bossEnemy)
		hits = NumFalls.GetValue()
		total = TotalFalls.GetValue()
		if !doOnce
			CheckHealth(bossEnemy)
			doOnce = TRUE
		endif
		if(hits < total)
			bossScream.Play(Game.GetPlayer())
			bossEnemy.DamageAV("Health", HitDamage)
			Utility.Wait(3)
			bossEnemy.MoveToMyEditorLocation()
			NumFalls.Mod(1.0)
			WoL.Log(self, "Fall registered on Welding soldier." + (hits + 1) + "/" + total + "falls.")
			if bossEnemy.isDead() && !bossEnemy.isDisabled()
				WoL.Log(self, "Welding Soldier died prematurely! Hits:" + NumFalls.GetValue() + ". Resurrecting", 1)
				bossEnemy.resurrect()
			endif
		else
			bossEnemy.DisableNoWait()
			reward.EnableNoWait()
			effectSpell.Cast(reward, reward)
			minibossMusic.Remove()
			bossDie.Play(Game.GetPlayer())
			Utility.Wait(1)
			wallBall.DisableNoWait()
			WoL.Log(self, "Welding Soldier defeated, Rod of Ohm enabled") 
		endif
	endif
EndEvent

Function CheckHealth(Actor akActor)
	Float BaseValue = akActor.GetBaseActorValue("Health")
	Float CurrentMaxValue = Math.Ceiling(akActor.GetActorValue("Health") / akActor.GetActorValuePercentage("Health"))
	Float ValueDifference = CurrentMaxValue - (akactor.GetActorValue("Health"))
	akactor.RestoreAV("Health", ValueDifference)
	HitDamage = ((CurrentMaxValue / total) - 1)
	WoL.log(self, "Welding soldier hit value calculated to be" + HitDamage)
EndFunction