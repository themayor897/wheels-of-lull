Scriptname _lull_mcmconfig extends SKI_ConfigBase

; Main Page ===========================================================

;Config =================================================

GlobalVariable Property _lull_stoneholeghosts Auto
GlobalVariable Property _lull_surprise Auto

Bool MutantDeath
Actor[] Property WhitehornMutants Auto

Bool FoundrySwitches
ObjectReference Property _lull_FoundryLeverParent Auto

GlobalVariable Property _lull_shieldstamina Auto

Bool RecoveryTriggers
ObjectReference Property RecoveryEnabler Auto
; Toggle Options ^^ 

GlobalVariable Property _lull_MasscroftTotal Auto
; Slider Options ^^ 

;Debug =================================================

GlobalVariable Property _lull_DebugLogging Auto
Quest Property _Lull_UT_Debug Auto
Quest Property _Lull_UT_Test Auto

Int Property QMenu = 0 Auto Hidden
String[] Property QMenu_Str Auto Hidden

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
	_lull_shieldstamina.SetValue(0)
	; Toggle Options ^^ 

	_lull_MasscroftTotal.SetValue(5)
	; Slider Options ^^ 

;Debug =================================================

	QMenu_Str = New String[8]
	QMenu_Str[0] = "Select Quest"
	QMenu_Str[1] = "01 Deep Down"
	QMenu_Str[2] = "02 Sky Spy"
	QMenu_Str[3] = "03 Mer in the High Castle"
	QMenu_Str[4] = "04 Boiling Foundry"
	QMenu_Str[5] = "05 Brass Forest"
	QMenu_Str[6] = "06 Bottom of the World"
	QMenu_Str[7] = "07 Wheels of Lull"

EndFunction

Event OnPageReset(string page)
	SetCursorFillMode(TOP_TO_BOTTOM) 

	If Page == ""
		;Title Page
	ElseIf Page == "$gen_Config"

		AddHeaderOption("$gen_Env")
		AddToggleOptionST("OID__lull_stoneholeghosts", "$gen_SpookyStonehole", _lull_stoneholeghosts.GetValue() as Int)
		;AddToggleOptionST("OID__lull_surprise", "Surprise?", _lull_surprise.GetValue() as Int)
		AddHeaderOption("$gen_Battle")
		AddSliderOptionST("OID__lull_MasscroftTotal", "$gen_MasscroftDrops", _lull_MasscroftTotal.GetValue(), "{0}")
		AddToggleOptionST("OID__lull_mutantdeath", "$gen_KillableMutants", MutantDeath)
		AddHeaderOption("$gen_Misc")
		AddToggleOptionST("OID__lull_foundryswitches", "$gen_FoundryPistons", FoundrySwitches)
		AddToggleOptionST("OID__lull_shieldstamina", "$gen_ShieldStamina", _lull_shieldstamina.GetValue() as Int)
		AddToggleOptionST("OID__lull_RecoveryTriggers", "$gen_RecoveryTriggers", RecoveryTriggers)
		
	ElseIf Page == "$db_Debug"
	
		AddToggleOptionST("OID__lull_debugging", "$db_Logging", _lull_DebugLogging.GetValue() as Int)
		GlobalVariable grs = Game.GetFormFromFile(0x0008E5, "WheelsOfLull.esp") as GlobalVariable
		If grs.GetValue() == ((math.abs(-16.344 * 1000)) + (1937.75 * -8))
			AddMenuOptionST("OID_QMenu", "Select Quest", QMenu_Str[QMenu])
		endIf
		
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
		If MutantDeath == 0
			MutantDeath = 1
			SetMutantDeath(false)
		Else
			MutantDeath = 0
			SetMutantDeath(true)
		Endif 
		
		SetToggleOptionValueST(MutantDeath)
		
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

State OID__lull_RecoveryTriggers
	event OnHighlightST()
		SetInfoText("$gen_RecoveryTriggersInfo")
	EndEvent 

	event OnSelectST()
		If RecoveryTriggers == 0
			RecoveryTriggers = 1
			RecoveryEnabler.enable()
		Else
			RecoveryTriggers = 0
			RecoveryEnabler.disable()
		Endif 

		SetToggleOptionValueST(RecoveryTriggers)
		
	EndEvent 

EndState 

state OID__lull_debugging
	
	Event OnHighlightST()
		SetInfoText("$db_LoggingInfo")
	endEvent
	
	Event OnSelectST()
		SetOptionFlagsST(1)
		If _lull_DebugLogging.GetValue() as Int == 1
			SetToggleOptionValueST(FALSE)
			_Lull_UT_Debug.Stop()
		else
			SetToggleOptionValueST(TRUE)
			_Lull_UT_Debug.Start()
		endIf
	EndEvent	

	
	Event OnDefaultST()
		_Lull_UT_Debug.Stop()
		SetToggleOptionValueST(0)
	endEvent

endState 

state OID_QMenu

	event OnHighlightST()
		SetInfoText("Do not select again until previous quest has fully loaded. Do not select earlier quest than you're running.")
	EndEvent 

	Event OnMenuOpenST()
		SetMenuDialogStartIndex(QMenu)
		SetMenuDialogDefaultIndex(0)
		SetMenuDialogOptions(QMenu_Str)
	EndEvent 

	Event OnMenuAcceptST(int a_index)
		QMenu = a_index
		SetMenuOptionValueST(QMenu_Str[a_index])
		if a_index == 1
			_Lull_UT_Test.SetStage(10)
		elseif a_index == 2
			_Lull_UT_Test.SetStage(10)
			Utility.Wait(1)
			_Lull_UT_Test.SetStage(20)
		elseif a_index == 3
			_Lull_UT_Test.SetStage(10)
			Utility.Wait(1)
			_Lull_UT_Test.SetStage(20)
			Utility.Wait(1)
			_Lull_UT_Test.SetStage(30)
		elseif a_index == 4
			_Lull_UT_Test.SetStage(10)
			Utility.Wait(1)
			_Lull_UT_Test.SetStage(20)
			Utility.Wait(1)
			_Lull_UT_Test.SetStage(30)
			Utility.Wait(1)
			_Lull_UT_Test.SetStage(40)
		elseif a_index == 5
			_Lull_UT_Test.SetStage(10)
			Utility.Wait(1)
			_Lull_UT_Test.SetStage(20)
			Utility.Wait(1)
			_Lull_UT_Test.SetStage(30)
			Utility.Wait(1)
			_Lull_UT_Test.SetStage(40)
			Utility.Wait(1)
			_Lull_UT_Test.SetStage(50)
		elseif a_index == 6
			_Lull_UT_Test.SetStage(10)
			Utility.Wait(1)
			_Lull_UT_Test.SetStage(20)
			Utility.Wait(1)
			_Lull_UT_Test.SetStage(30)
			Utility.Wait(1)
			_Lull_UT_Test.SetStage(40)
			Utility.Wait(1)
			_Lull_UT_Test.SetStage(50)
			Utility.Wait(1)
			_Lull_UT_Test.SetStage(60)
		elseif a_index == 7
			_Lull_UT_Test.SetStage(10)
			Utility.Wait(1)
			_Lull_UT_Test.SetStage(20)
			Utility.Wait(1)
			_Lull_UT_Test.SetStage(30)
			Utility.Wait(1)
			_Lull_UT_Test.SetStage(40)
			Utility.Wait(1)
			_Lull_UT_Test.SetStage(50)
			Utility.Wait(1)
			_Lull_UT_Test.SetStage(60)
			Utility.Wait(1)
			_Lull_UT_Test.SetStage(70)
		endif
	EndEvent 

	Event OnDefaultST()
		QMenu = 0
		SetMenuOptionValueST(QMenu_Str[0])
	EndEvent 

EndState 
	 
	 
	 
Function SetMutantDeath(bool isInvul)
	Int iElement = WhitehornMutants.Length
	While iElement
		iElement -= 1
		WhitehornMutants[iElement].GetActorBase().SetInvulnerable(isInvul)
	EndWhile	 
EndFunction 