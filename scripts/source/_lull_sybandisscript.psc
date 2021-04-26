scriptName _Lull_SybandisScript extends ObjectReference

;Modifed 4.25.21 by themayor897. Cleaned up leftover compiler-generated variables, swapped out debug messageboxes, added message about dragon souls being removed.


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

Actor Property PlayerRef auto
Message Property Punished01 auto
Message Property Punished02 auto
Message Property Punished03 auto

Event OnActivate(ObjectReference akActionRef)

	utility.Wait(3)
	eye1.EnableNoWait(TRUE)
	eye2.EnableNoWait(TRUE)
	eye3.EnableNoWait(TRUE)
	eye4.EnableNoWait(TRUE)
	sybandisNoise.Play(PlayerRef)
	utility.Wait(5)
	PlayerRef.MoveTo(endMarker)
	Punished01.show()
	PlayerRef.SetAV("DragonSouls", 0)
	Punished03.show()
	PlayerRef.RemoveItem(visor, PlayerRef.GetItemCount(visor))
	if usedBoil.GetValue() >= 1
		PlayerRef.RemoveItem(rod, PlayerRef.GetItemCount(rod))
	endIf
	if usedBrass.GetValue() >= 1
		PlayerRef.RemoveItem(unwinder, PlayerRef.GetItemCount(unwinder))
	endIf
	if usedBottom.GetValue() >= 1
		PlayerRef.RemoveItem(lullshield, PlayerRef.GetItemCount(lullshield))
	endIf
	if timesUsed.GetValue() >= 3
		Punished02.show()
		PlayerRef.RemoveItem(gold, 10000)
	endIf
	
endEvent
