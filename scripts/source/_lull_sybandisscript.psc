scriptName _Lull_SybandisScript extends ObjectReference

globalvariable property usedBoil auto
globalvariable property usedBrass auto
armor property lullshield auto
ObjectReference property eye2 auto
ObjectReference property eye4 auto
globalvariable property timesUsed auto
ObjectReference property eye1 auto
ObjectReference property eye3 auto
sound property sybandisNoise auto
ObjectReference property endMarker auto
miscobject property gold auto
globalvariable property usedBottom auto
weapon property unwinder auto
armor property visor auto
weapon property rod auto

Event OnActivate(ObjectReference akActionRef)

	utility.Wait(3 as Float)
	eye1.EnableNoWait(1 as Bool)
	eye2.EnableNoWait(1 as Bool)
	eye3.EnableNoWait(1 as Bool)
	eye4.EnableNoWait(1 as Bool)
	sybandisNoise.Play(game.GetPlayer() as ObjectReference)
	utility.Wait(5 as Float)
	game.GetPlayer().MoveTo(endMarker, 0.000000, 0.000000, 0.000000, true)
	debug.MessageBox("For using the lantern, Sybandis punishes you, removing any items you used the lantern to acquire as well as some of your power! You suppose you shouldn't have cheated.")
	game.GetPlayer().SetAV("DragonSouls", 0 as Float)
	game.GetPlayer().RemoveItem(visor as form, game.GetPlayer().GetItemCount(visor as form), false, none)
	if usedBoil.GetValue() >= 1 as Float
		game.GetPlayer().RemoveItem(rod as form, game.GetPlayer().GetItemCount(rod as form), false, none)
	endIf
	if usedBrass.GetValue() >= 1 as Float
		game.GetPlayer().RemoveItem(unwinder as form, game.GetPlayer().GetItemCount(unwinder as form), false, none)
	endIf
	if usedBottom.GetValue() >= 1 as Float
		game.GetPlayer().RemoveItem(lullshield as form, game.GetPlayer().GetItemCount(lullshield as form), false, none)
	endIf
	if timesUsed.GetValue() >= 3 as Float
		debug.MessageBox("Because you used the lantern so many times, you are further punished.")
		game.GetPlayer().RemoveItem(gold as form, 10000, false, none)
	endIf
	
endEvent
