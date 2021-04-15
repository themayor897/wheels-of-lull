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
			bossEnemy.DamageAV("Health", (hits*HitDamage))
			bossEnemy.MoveToMyEditorLocation()
			NumFalls.Mod(1.0)
		else
			bossEnemy.DisableNoWait()
			reward.EnableNoWait()
			effectSpell.Cast(reward, reward)
			minibossMusic.Remove()
			bossDie.Play(Game.GetPlayer())
			Utility.Wait(1)
			wallBall.DisableNoWait()
		endif
	endif
EndEvent

Function CheckHealth(Actor akActor)
	Float BaseValue = akActor.GetBaseActorValue("Health")
	Float CurrentMaxValue = Math.Ceiling(akActor.GetActorValue("Health") / akActor.GetActorValuePercentage("Health"))
	Float ValueDifference = CurrentMaxValue - (akactor.GetActorValue("Health"))
	akactor.RestoreAV("Health", ValueDifference)
	HitDamage = ((CurrentMaxValue / hits) - 1)
EndFunction