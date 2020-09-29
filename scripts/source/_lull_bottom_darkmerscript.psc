Scriptname _Lull_Bottom_DarkmerScript extends Actor

ObjectReference Property myLever auto
ActorBase Property darkMaer auto

Event OnLoad()
	RegisterForSingleUpdate(0.5)
EndEvent

Event OnUpdate()
	if(GetActorValue("Health") >= 17000)
		setActorValue("Health", 17000)
	endif
	float damageNum = (self.GetLightLevel() * 10)
	self.DamageAV("Health", damageNum)
	RegisterForSingleUpdate(0.5)
EndEvent

Event OnDeath(Actor akKiller)
	if(darkMaer.GetDeadCount() >= 3)
		myLever.EnableNoWait(1)
	endif
EndEvent

