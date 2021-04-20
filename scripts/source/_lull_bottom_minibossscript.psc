Scriptname _Lull_Bottom_MinibossScript extends Actor  

ObjectReference Property lullshield auto
Spell Property lightBall auto
MusicType Property minibossMusic auto
ObjectReference Property PlayerRef auto

Event OnLoad()
	SetDontMove()
	RegisterForSingleUpdate(6)
	setav("Health", 30000)
	forceav("Health", 30000)
	WoL.Log(self, "Outlighter health set to" + getav("Health") + "/" + getbaseav("Health"))
EndEvent

Event OnUpdate()
	Debug.SendAnimationEvent(self, "aggroWarningStart")
	lightBall.Cast(self, PlayerRef)
	RegisterForSingleUpdate(6)
EndEvent

Event OnDeath(Actor akKiller)
	DisableNoWait(1)
	minibossMusic.Remove()
	UnregisterForUpdate()
	lullShield.EnableNoWait(1)
	WoL.Log(self, "Outlighter killed, Lullian Shield enabled.")
EndEvent