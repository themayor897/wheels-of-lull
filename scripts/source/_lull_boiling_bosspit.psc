Scriptname _Lull_Boiling_BossPit extends ObjectReference  

ObjectReference Property bossEnemy auto
ObjectReference Property reward auto
ObjectReference Property wallBall auto
Sound Property bossScream auto
Sound Property bossDie auto
Spell Property effectSpell auto
int numberOfTimes = 0;
MusicType Property minibossMusic auto

Event OnTriggerEnter(ObjectReference akActionRef)
	if(akActionRef == bossEnemy)
		if(numberOfTimes < 3)
			bossEnemy.MoveToMyEditorLocation()
			numberOfTimes += 1
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