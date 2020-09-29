Scriptname _Lull_Bottom_MinibossScript extends ObjectReference  

ObjectReference Property lullshield auto
Spell Property lightBall auto
Actor Property outLighter auto
MusicType Property minibossMusic auto
Event OnLoad()
	outLighter.SetDontMove()
	RegisterForSingleUpdate(6)
EndEvent

Event OnUpdate()
	Debug.SendAnimationEvent(self, "aggroWarningStart")
	lightBall.Cast(self, Game.GetPlayer())
	RegisterForSingleUpdate(6)
EndEvent

Event OnDeath(Actor akKiller)
	DisableNoWait(1)
	minibossMusic.Remove()
	UnregisterForUpdate()
	lullShield.EnableNoWait(1)
EndEvent