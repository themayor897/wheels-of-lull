scriptName _Lull_SkySpyNuminarbarrier extends ObjectReference

scene property numinarTalks auto
actor property numinar auto
sound property securitySound auto
ObjectReference property numinarBarrier auto
quest property skySpy auto
globalvariable property barreirOne auto

Bool doOnce = false


Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == game.GetPlayer() as ObjectReference
		if !doOnce
			if skySpy.GetStage() < 10
				if barreirOne.GetValue() == 0 as Float
					game.DisablePlayerControls(true, true, false, false, false, true, true, false, 0)
					securitySound.Play(game.GetPlayer() as ObjectReference)
					numinar.EnableNoWait(1 as Bool)
					numinarBarrier.EnableNoWait(1 as Bool)
					utility.Wait(4 as Float)
					numinarTalks.Start()
					doOnce = true
					barreirOne.setValue(1 as Float)
				endIf
			endIf
		endIf
	endIf
endEvent
