Scriptname _lull_mcmconfig extends SKI_ConfigBase

; Main Page ===========================================================

;Config =================================================

GlobalVariable Property _lull_stoneholeghosts Auto
GlobalVariable Property _lull_surprise Auto
GlobalVariable Property _lull_mutantdeath Auto

Bool FoundrySwitches
ObjectReference Property _lull_FoundryLeverParent Auto

GlobalVariable Property _lull_shieldstamina Auto
; Toggle Options ^^ 

GlobalVariable Property _lull_MasscroftTotal Auto
; Slider Options ^^ 

;Debug =================================================

GlobalVariable Property _lull_DebugLogging Auto
Quest Property _Lull_UT_Debug Auto

Event OnConfigInit()
	Utility.Wait(1)
	RegisterForSingleUpdate(1)
EndEvent

Event OnUpdate()
	InstallMCM()
EndEvent 

Function InstallMCM()
	ModName = "The Wheels of Lull"
	Pages = New String[2]
	Pages[0] = "$gen_Config"
	Pages[1] = "$db_Debug"
; Main Page ===========================================================

;Config =================================================

	_lull_stoneholeghosts.SetValue(0)
	_lull_surprise.SetValue(1)
	_lull_mutantdeath.SetValue(0)
	_lull_shieldstamina.SetValue(0)
	; Toggle Options ^^ 

	_lull_MasscroftTotal.SetValue(5)
	; Slider Options ^^ 

;Debug =================================================

EndFunction

Event OnPageReset(string page)
	SetCursorFillMode(TOP_TO_BOTTOM) 

	If Page == ""
		;Title Page
	ElseIf Page == "$gen_Config"

		AddHeaderOption("$gen_Env")
		AddToggleOptionST("OID__lull_stoneholeghosts", "$gen_SpookyStonehole", _lull_stoneholeghosts.GetValue() as Int)
		;AddToggleOptionST("OID__lull_surprise", "Surprise?", _lull_surprise.GetValue() as Int)
		AddHeaderOption("$gen_battle")
		AddSliderOptionST("OID__lull_MasscroftTotal", "$gen_MasscroftDrops", _lull_MasscroftTotal.GetValue(), "{0}")
		AddToggleOptionST("OID__lull_mutantdeath", "$gen_KillableMutants", _lull_mutantdeath.GetValue() as Int)
		AddHeaderOption("$gen_Misc")
		AddToggleOptionST("OID__lull_foundryswitches", "$gen_FoundryPistons", FoundrySwitches)
		AddToggleOptionST("OID__lull_shieldstamina", "$gen_ShieldStamina", _lull_shieldstamina.GetValue() as Int)
		
	ElseIf Page == "$db_Debug"
	
		AddToggleOptionST("OID__lull_debugging", "$db_Logging", _lull_DebugLogging.GetValue() as Int)
		
	Endif
EndEvent

State OID__lull_stoneholeghosts
	event OnHighlightST()
		SetInfoText("$gen_SpookyStoneholeInfo")
	EndEvent 

	event OnSelectST()
		Int Value = _lull_stoneholeghosts.GetValue() as Int
		If Value == 0
			Value = 1
		Else
			Value = 0
		Endif 

		_lull_stoneholeghosts.SetValue(Value)
		SetToggleOptionValueST(Value)
	EndEvent 

EndState 

;State OID__lull_surprise
;	event OnHighlightST()
;		SetInfoText("Adds some spooky surprises. Turn off if you don't like scary stuff.")
;	EndEvent 
;
;	event OnSelectST()
;		Int Value = _lull_surprise.GetValue() as Int
;		If Value == 0
;			Value = 1
;		Else
;			Value = 0
;		Endif 
;
;		_lull_surprise.SetValue(Value)
;		SetToggleOptionValueST(Value)
;	EndEvent 

;EndState 

State OID__lull_mutantdeath
	event OnHighlightST()
		SetInfoText("$gen_KillableMutantsInfo")
	EndEvent 

	event OnSelectST()
		Int Value = _lull_mutantdeath.GetValue() as Int
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
		SetInfoText("$gen_MasscroftDropsInfo")
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
		SetInfoText("$gen_FoundryPistonsInfo")
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
		SetInfoText("$gen_ShieldStaminaInfo")
	EndEvent 

	event OnSelectST()
		Int Value = _lull_shieldstamina.GetValue() as Int
		If Value == 0
			Value = 1
		Else
			Value = 0
		Endif 

		_lull_shieldstamina.SetValue(Value)
		SetToggleOptionValueST(Value)
	EndEvent 

EndState 

state OID__lull_debugging
	
	Event OnHighlightST()
		SetInfoText("$db_LoggingInfo")
	endEvent
	
	Event OnSelectST()
		SetOptionFlagsST(1)
		Int Value = _lull_DebugLogging.GetValue() as Int
		if Value == 1
			Value = 0
			_Lull_UT_Debug.Stop()
		else
			Value = 1
			_Lull_UT_Debug.Start()
		endIf
		
		SetToggleOptionValueST(Value)		
	EndEvent	

	
	Event OnDefaultST()
		_Lull_UT_Debug.Stop()
		SetToggleOptionValueST(0)
	endEvent

endState 