Scriptname _Lull_Boiling_BossPit extends ObjectReference  

;Modified April 2021 by themayor897 - added logging functions
;Modified 11 May 2021 by themayor897 - transitioned death functions to mq04 script fragment

Actor Property bossEnemy auto
ObjectReference Property reward auto
ObjectReference Property wallBall auto
Sound Property bossScream auto
Sound Property bossDie auto
Spell Property effectSpell auto
GlobalVariable property NumFalls auto
GlobalVariable property TotalFalls auto
MusicType Property minibossMusic auto
Quest Property MQ04 Auto
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
			MQ04.SetStage(22) 
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