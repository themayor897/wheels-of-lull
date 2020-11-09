scriptName _Lull_Boiling_ActivateMonster extends ObjectReference

;-- Properties --------------------------------------
ObjectReference property monsterToEnable auto

;-- Variables ---------------------------------------
Bool doOnce = false

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)

	if !doOnce
		doOnce = true
		monsterToEnable.DisableNoWait(false)
	endIf
	
endEvent 