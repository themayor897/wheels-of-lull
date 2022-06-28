
scriptName _lull_mcmconfig extends SKI_ConfigBase

;-- Properties --------------------------------------
globalvariable property _lull_MasscroftTotal auto
quest property _Lull_UT_Test auto
objectreference property RecoveryEnabler auto
globalvariable property _lull_shieldstamina auto
String[] property QMenu_Str auto hidden
Int property QMenu = 0 auto hidden
quest property _Lull_UT_Debug auto
globalvariable property _lull_surprise auto
globalvariable property _lull_stoneholeghosts auto
globalvariable property _lull_DebugLogging auto
actor[] property WhitehornMutants auto
objectreference property _lull_FoundryLeverParent auto

;-- Variables ---------------------------------------
Bool RecoveryTriggers
Bool FoundrySwitches= true
Bool MutantDeath

;-- Functions ---------------------------------------

function OnPageReset(String page)

    self.SetCursorFillMode(self.TOP_TO_BOTTOM)
    if page == ""
        
    elseIf page == "$gen_Config"
        self.AddHeaderOption("$gen_Env", 0)
        self.AddToggleOptionST("OID__lull_stoneholeghosts", "$gen_SpookyStonehole", (_lull_stoneholeghosts.GetValue() as Int) as Bool, 0)
        self.AddHeaderOption("$gen_Battle", 0)
        self.AddSliderOptionST("OID__lull_MasscroftTotal", "$gen_MasscroftDrops", _lull_MasscroftTotal.GetValue(), "{0}", 0)
        self.AddToggleOptionST("OID__lull_mutantdeath", "$gen_KillableMutants", MutantDeath, 0)
        self.AddHeaderOption("$gen_Misc", 0)
        self.AddToggleOptionST("OID__lull_foundryswitches", "$gen_FoundryPistons", FoundrySwitches, 0)
        self.AddToggleOptionST("OID__lull_shieldstamina", "$gen_ShieldStamina", (_lull_shieldstamina.GetValue() as Int) as Bool, 0)
        self.AddToggleOptionST("OID__lull_RecoveryTriggers", "$gen_RecoveryTriggers", RecoveryTriggers, 0)
    elseIf page == "$db_Debug"
        self.AddToggleOptionST("OID__lull_debugging", "$db_Logging", (_lull_DebugLogging.GetValue() as Int) as Bool, 0)
        globalvariable grs = game.GetFormFromFile(2277, "WheelsOfLull.esp") as globalvariable
        if grs.GetValue() == math.abs(-16.3440 * 1000 as Float) + 1937.75 * -8 as Float
            self.AddMenuOptionST("OID_QMenu", "Select Quest", QMenu_Str[QMenu], 0)
        endIf
    endIf
endFunction

; Skipped compiler generated GetState

function InstallMCM()

    ModName = "The Wheels of Lull"
    Pages = new String[2]
    Pages[0] = "$gen_Config"
    Pages[1] = "$db_Debug"
    _lull_stoneholeghosts.SetValue(0 as Float)
    _lull_surprise.SetValue(1 as Float)
    _lull_shieldstamina.SetValue(0 as Float)
    _lull_MasscroftTotal.SetValue(5 as Float)
    QMenu_Str = new String[8]
    QMenu_Str[0] = "Select Quest"
    QMenu_Str[1] = "01 Deep Down"
    QMenu_Str[2] = "02 Sky Spy"
    QMenu_Str[3] = "03 Mer in the High Castle"
    QMenu_Str[4] = "04 Boiling Foundry"
    QMenu_Str[5] = "05 Brass Forest"
    QMenu_Str[6] = "06 Bottom of the World"
    QMenu_Str[7] = "07 Wheels of Lull"
endFunction

function SetMutantDeath(Bool isInvul)

    Int iElement = WhitehornMutants.length
    while iElement
        iElement -= 1
        WhitehornMutants[iElement].GetActorBase().SetInvulnerable(isInvul)
    endWhile
endFunction

; Skipped compiler generated GotoState

function OnUpdate()

    self.InstallMCM()
endFunction

function OnConfigInit()

    utility.Wait(1 as Float)
    self.RegisterForSingleUpdate(1 as Float)
endFunction

;-- State -------------------------------------------
state OID__lull_mutantdeath

    function OnHighlightST()

        self.SetInfoText("$gen_KillableMutantsInfo")
    endFunction

    function OnSelectST()

        if MutantDeath == 0 as Bool
            MutantDeath = 1 as Bool
            self.SetMutantDeath(false)
        else
            MutantDeath = 0 as Bool
            self.SetMutantDeath(true)
        endIf
        self.SetToggleOptionValueST(MutantDeath, false, "")
    endFunction
endState

;-- State -------------------------------------------
state OID__lull_shieldstamina

    function OnHighlightST()

        self.SetInfoText("$gen_ShieldStaminaInfo")
    endFunction

    function OnSelectST()

        Int value = _lull_shieldstamina.GetValue() as Int
        if value == 0
            value = 1
        else
            value = 0
        endIf
        _lull_shieldstamina.SetValue(value as Float)
        self.SetToggleOptionValueST(value as Bool, false, "")
    endFunction
endState

;-- State -------------------------------------------
state OID__lull_RecoveryTriggers

    function OnHighlightST()

        self.SetInfoText("$gen_RecoveryTriggersInfo")
    endFunction

    function OnSelectST()

        if RecoveryTriggers == 0 as Bool
            RecoveryTriggers = 1 as Bool
            RecoveryEnabler.enable(false)
        else
            RecoveryTriggers = 0 as Bool
            RecoveryEnabler.disable(false)
        endIf
        self.SetToggleOptionValueST(RecoveryTriggers, false, "")
    endFunction
endState

;-- State -------------------------------------------
state OID__lull_debugging

    function OnHighlightST()

        self.SetInfoText("$db_LoggingInfo")
    endFunction

    function OnDefaultST()

        _Lull_UT_Debug.Stop()
        self.SetToggleOptionValueST(0 as Bool, false, "")
    endFunction

    function OnSelectST()

        self.SetOptionFlagsST(1, false, "")
        if _lull_DebugLogging.GetValue() as Int == 1
            self.SetToggleOptionValueST(false, false, "")
            _Lull_UT_Debug.Stop()
        else
            self.SetToggleOptionValueST(true, false, "")
            _Lull_UT_Debug.Start()
        endIf
    endFunction
endState

;-- State -------------------------------------------
state OID_QMenu

    function OnMenuAcceptST(Int a_index)

        QMenu = a_index
        self.SetMenuOptionValueST(QMenu_Str[a_index], false, "")
        if a_index == 1
            _Lull_UT_Test.SetStage(10)
        elseIf a_index == 2
            _Lull_UT_Test.SetStage(10)
            utility.Wait(1 as Float)
            _Lull_UT_Test.SetStage(20)
        elseIf a_index == 3
            _Lull_UT_Test.SetStage(10)
            utility.Wait(1 as Float)
            _Lull_UT_Test.SetStage(20)
            utility.Wait(1 as Float)
            _Lull_UT_Test.SetStage(30)
        elseIf a_index == 4
            _Lull_UT_Test.SetStage(10)
            utility.Wait(1 as Float)
            _Lull_UT_Test.SetStage(20)
            utility.Wait(1 as Float)
            _Lull_UT_Test.SetStage(30)
            utility.Wait(1 as Float)
            _Lull_UT_Test.SetStage(40)
        elseIf a_index == 5
            _Lull_UT_Test.SetStage(10)
            utility.Wait(1 as Float)
            _Lull_UT_Test.SetStage(20)
            utility.Wait(1 as Float)
            _Lull_UT_Test.SetStage(30)
            utility.Wait(1 as Float)
            _Lull_UT_Test.SetStage(40)
            utility.Wait(1 as Float)
            _Lull_UT_Test.SetStage(50)
        elseIf a_index == 6
            _Lull_UT_Test.SetStage(10)
            utility.Wait(1 as Float)
            _Lull_UT_Test.SetStage(20)
            utility.Wait(1 as Float)
            _Lull_UT_Test.SetStage(30)
            utility.Wait(1 as Float)
            _Lull_UT_Test.SetStage(40)
            utility.Wait(1 as Float)
            _Lull_UT_Test.SetStage(50)
            utility.Wait(1 as Float)
            _Lull_UT_Test.SetStage(60)
        elseIf a_index == 7
            _Lull_UT_Test.SetStage(10)
            utility.Wait(1 as Float)
            _Lull_UT_Test.SetStage(20)
            utility.Wait(1 as Float)
            _Lull_UT_Test.SetStage(30)
            utility.Wait(1 as Float)
            _Lull_UT_Test.SetStage(40)
            utility.Wait(1 as Float)
            _Lull_UT_Test.SetStage(50)
            utility.Wait(1 as Float)
            _Lull_UT_Test.SetStage(60)
            utility.Wait(1 as Float)
            _Lull_UT_Test.SetStage(70)
        endIf
    endFunction

    function OnHighlightST()

        self.SetInfoText("Do not select again until previous quest has fully loaded. Do not select earlier quest than you're running.")
    endFunction

    function OnMenuOpenST()

        self.SetMenuDialogStartIndex(QMenu)
        self.SetMenuDialogDefaultIndex(0)
        self.SetMenuDialogOptions(QMenu_Str)
    endFunction

    function OnDefaultST()

        QMenu = 0
        self.SetMenuOptionValueST(QMenu_Str[0], false, "")
    endFunction
endState

;-- State -------------------------------------------
state OID__lull_foundryswitches

    function OnHighlightST()

        self.SetInfoText("$gen_FoundryPistonsInfo")
    endFunction

    function OnSelectST()

        if FoundrySwitches == 0 as Bool
            FoundrySwitches = 1 as Bool
            _lull_FoundryLeverParent.enable(false)
        else
            FoundrySwitches = 0 as Bool
            _lull_FoundryLeverParent.disable(false)
        endIf
        self.SetToggleOptionValueST(FoundrySwitches, false, "")
    endFunction
endState

;-- State -------------------------------------------
state OID__lull_MasscroftTotal

    function OnSliderOpenST()

        self.SetSliderDialogStartValue(_lull_MasscroftTotal.GetValue())
        self.SetSliderDialogDefaultValue(5 as Float)
        self.SetSliderDialogRange(2 as Float, 15 as Float)
        self.SetSliderDialogInterval(1 as Float)
    endFunction

    function OnHighlightST()

        self.SetInfoText("$gen_MasscroftDropsInfo")
    endFunction

    function OnDefaultST()

        _lull_MasscroftTotal.SetValue(5 as Float)
        self.SetSliderOptionValueST(5 as Float, "{0}", false, "")
    endFunction

    function OnSliderAcceptST(Float value)

        _lull_MasscroftTotal.SetValue(value)
        self.SetSliderOptionValueST(value, "{0}", false, "")
    endFunction
endState

;-- State -------------------------------------------
state OID__lull_stoneholeghosts

    function OnHighlightST()

        self.SetInfoText("$gen_SpookyStoneholeInfo")
    endFunction

    function OnSelectST()

        Int value = _lull_stoneholeghosts.GetValue() as Int
        if value == 0
            value = 1
        else
            value = 0
        endIf
        _lull_stoneholeghosts.SetValue(value as Float)
        self.SetToggleOptionValueST(value as Bool, false, "")
    endFunction
endState
