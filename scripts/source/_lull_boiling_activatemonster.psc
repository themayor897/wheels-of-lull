scriptName _Lull_Boiling_ActivateMonster extends ObjectReference

;-- Properties --------------------------------------
ObjectReference property monsterToEnable auto
ObjectReference property brokenSentinal auto

;-- Variables ---------------------------------------
Bool doOnce = false

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)

	if !doOnce
		doOnce = true
		brokenSentinal.disable()
		monsterToEnable.enable()
	endIf
	
endEvent 