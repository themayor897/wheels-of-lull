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

Event OnTriggerEnter(ObjectReference akActionRef)
	if(akActionRef == bossEnemy)
		if(NumFalls.getvalue() < TotalFalls.getvalue())
			bossEnemy.MoveToMyEditorLocation()
			NumFalls.Mod(1.0)
			bossEnemy.damageav("health", ((bossEnemy.getbaseav("health"))/3))
			bossScream.Play(Game.GetPlayer())
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