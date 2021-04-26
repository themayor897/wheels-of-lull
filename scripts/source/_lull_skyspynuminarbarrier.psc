scriptName _Lull_SkySpyNuminarbarrier extends ObjectReference

scene property numinarTalks auto
actor property numinar auto
sound property securitySound auto
ObjectReference property numinarBarrier auto
quest property skySpy auto
;globalvariable property barreirOne auto
 
ObjectReference property marker1 auto

Bool barreirOne = false

Bool doOnce = false


Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == game.GetPlayer() as ObjectReference
		if !doOnce
			if skySpy.GetStage() < 10
				if !barreirOne
					WoL.Log(self, "Numinar barrier enabled")
					game.DisablePlayerControls(true, true, false, false, false, true, true, false, 0)
					securitySound.Play(game.GetPlayer() as ObjectReference)
					numinar.EnableNoWait(1 as Bool)
					numinar.moveto(marker1)
					numinar.setdontmove()
					numinarBarrier.EnableNoWait(1 as Bool)
					utility.Wait(4 as Float)
					numinarTalks.Start()
					doOnce = true
					barreirOne = true
					self.disable()
				endIf
			endIf
		endIf
	endIf
endEvent
