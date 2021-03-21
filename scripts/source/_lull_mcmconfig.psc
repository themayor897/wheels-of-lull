Scriptname _lull_mcmconfig extends SKI_ConfigBase

; Main Page ===========================================================
GlobalVariable Property _lull_stoneholeghosts Auto
GlobalVariable Property _lull_surprise Auto
GlobalVariable Property _lull_mutantdeath Auto

Bool FoundrySwitches
ObjectReference Property _lull_FoundryLeverParent Auto

GlobalVariable Property _lull_shieldstamina Auto
; Toggle Options ^^ 

GlobalVariable Property _lull_MasscroftTotal Auto
; Slider Options ^^ 


Event OnConfigInit()
	Utility.Wait(1)
	RegisterForSingleUpdate(1)
EndEvent

Event OnUpdate()
	InstallMCM()
EndEvent 

Function InstallMCM()
	ModName = "The Wheels of Lull"
; Main Page ===========================================================
	_lull_stoneholeghosts.SetValue(0)
	_lull_surprise.SetValue(0)
	_lull_mutantdeath.SetValue(0)
	_lull_shieldstamina.SetValue(0)
	; Toggle Options ^^ 

	_lull_MasscroftTotal.SetValue(5)
	; Slider Options ^^ 

EndFunction

Event OnPageReset(string page)
	SetCursorFillMode(TOP_TO_BOTTOM) 

	If Page == ""
		AddHeaderOption("Spooky Elements")
		AddToggleOptionST("OID__lull_stoneholeghosts", "No Ghosts in Stonehole", _lull_stoneholeghosts.GetValueInt())
		AddToggleOptionST("OID__lull_surprise", "Surprise?", _lull_surprise.GetValueInt())
		AddHeaderOption("Battle Configuration")
		AddSliderOptionST("OID__lull_MasscroftTotal", "Masscroft Pit Drops", _lull_MasscroftTotal.GetValue(), "{0}")
		AddToggleOptionST("OID__lull_mutantdeath", "Killable Whitehorn Mutants", _lull_mutantdeath.GetValueInt())
		AddHeaderOption("Misc. Config")
		AddToggleOptionST("OID__lull_foundryswitches", "Foundry Pistons Off Switch", FoundrySwitches)
		AddToggleOptionST("OID__lull_shieldstamina", "Lullian Shield Stamina", _lull_shieldstamina.GetValueInt())
	Endif
EndEvent

State OID__lull_stoneholeghosts
	event OnHighlightST()
		SetInfoText("Disable ghosts in stonehole mi")
	EndEvent 

	event OnSelectST()
		Int Value = _lull_stoneholeghosts.GetValueInt()
		If Value == 0
			Value = 1
		Else
			Value = 0
		Endif 

		_lull_stoneholeghosts.SetValue(Value)
		SetToggleOptionValueST(Value)
	EndEvent 

EndState 

State OID__lull_surprise
	event OnHighlightST()
		SetInfoText("Adds some spooky surprises.")
	EndEvent 

	event OnSelectST()
		Int Value = _lull_surprise.GetValueInt()
		If Value == 0
			Value = 1
		Else
			Value = 0
		Endif 

		_lull_surprise.SetValue(Value)
		SetToggleOptionValueST(Value)
	EndEvent 

EndState 

State OID__lull_mutantdeath
	event OnHighlightST()
		SetInfoText("Allows you to kill mutants in ")
	EndEvent 

	event OnSelectST()
		Int Value = _lull_mutantdeath.GetValueInt()
		If Value == 0
			Value = 1
		Else
			Value = 0
		Endif 

		_lull_mutantdeath.SetValue(Value)
		SetToggleOptionValueST(Value)
	EndEvent 

EndState 

State OID__lull_MasscroftTotal
	event OnHighlightST()
		SetInfoText("Set how many times you need to")
	EndEvent 

	event OnSliderOpenST()
		SetSliderDialogStartValue(_lull_MasscroftTotal.GetValue())
		SetSliderDialogDefaultValue(5)
		SetSliderDialogRange(2, 15)
		SetSliderDialogInterval(1)
	EndEvent 

	event OnSliderAcceptST(float value)
		_lull_MasscroftTotal.SetValue(Value)
		SetSliderOptionValueST(value, "{0}")
	EndEvent 

	Event OnDefaultST()
		_lull_MasscroftTotal.SetValue(5)
		SetSliderOptionValueST(5, "{0}")
	EndEvent 

EndState 

State OID__lull_foundryswitches
	event OnHighlightST()
		SetInfoText("Add levers to then end of each group of moving pistons to turn them off.")
	EndEvent 

	event OnSelectST()
		If FoundrySwitches == 0
			FoundrySwitches = 1
			_lull_FoundryLeverParent.enable()
		Else
			FoundrySwitches = 0
			_lull_FoundryLeverParent.disable()
		Endif 

		SetToggleOptionValueST(FoundrySwitches)
		
	EndEvent 

EndState 

State OID__lull_shieldstamina
	event OnHighlightST()
		SetInfoText("Reduce the amount of stamina r")
	EndEvent 

	event OnSelectST()
		Int Value = _lull_shieldstamina.GetValueInt()
		If Value == 0
			Value = 1
		Else
			Value = 0
		Endif 

		_lull_shieldstamina.SetValue(Value)
		SetToggleOptionValueST(Value)
	EndEvent 

EndState 