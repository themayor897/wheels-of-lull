scriptName PF__Lull_MQ06_TravelToPlayer_0436B7FC extends Package hidden


globalvariable property lullApproached auto
scene property saboteurScene auto
quest property mq06 auto

function Fragment_0(Actor akActor)

	lullApproached.SetValue(lullApproached.GetValue() + 1 as Float)
	if lullApproached.GetValue() >= 3 as Float
		saboteurScene.Start()
		mq06.SetStage(15)
	endIf
endFunction
