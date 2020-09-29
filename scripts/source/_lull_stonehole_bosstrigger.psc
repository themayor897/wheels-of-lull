Scriptname _Lull_Stonehole_Bosstrigger extends ObjectReference  

ObjectReference Property Miner1 auto
ObjectReference Property Miner2 auto
ObjectReference Property Miner3 auto
ObjectReference Property Miner4 auto
MusicType Property bossMusic auto
bool doOnce = false;
Sound Property spookSound auto
Sound Property spookSound2 auto

Event OnTriggerEnter(ObjectReference akActionRef)
if(akActionRef == Game.GetPlayer())
	if(!doOnce)
	spookSound.Play(Game.GetPlayer())
	Game.DisablePlayerControls()
	Game.ShakeCamera()
	Miner1.EnableNoWait(1)
	Utility.Wait(2)
	Miner2.EnableNoWait(1)
	Utility.Wait(2)
	Miner3.EnableNoWait(1)
	Utility.Wait(2)
	Miner1.DisableNoWait()
	Miner2.DisableNoWait()
	Miner3.DisableNoWait()
	Game.ShakeCamera()
	spookSound2.Play(Game.GetPlayer())
	Miner4.EnableNoWait(1)
	bossMusic.Add()
	Game.EnablePlayerControls()
	doOnce = true
	endif
endif
EndEvent