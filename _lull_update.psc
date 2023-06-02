Scriptname _Lull_Update extends Quest  

Import Game

GlobalVariable Property LullVersion Auto

GlobalVariable Property FishingAddonpresent Auto
GlobalVariable Property hasBrhuce auto 
GlobalVariable Property hasMzark auto 
GlobalVariable Property FishingAddonVersion Auto
Int Property sVersion = 50001 Auto Hidden ;translates to 5.0.1, adding an additional 0 before each of the second numbers. 
int property oldFishVersion = 0 auto hidden 
FormList Property MovedRefs Auto
Form[] aForceEditorLocation
 int fishVersion 
GlobalVariable Property iSKSE Auto
Bool HasSKSE

Message Property Installed40 Auto
actor property playerRef auto 
;For version 5.1.0
Quest Property MQ01 Auto
Message Property QuestStarted Auto
Bool Fixed510
perk Property ancientKnowledgeLull auto 
perk Property matchingsetLullHeavy auto 
perk Property matchingsetLullLight auto 
;For version 5.1.1
;Bool Fixed511
bool perkUpdatedone = false
bool fishUpdate 

Event OnInit()
    If SKSE.GetVersionRelease()
        iSKSE.SetValue(1)
        HasSKSE = True
          WoL.Log(self, "Wheels of Lull: SKSE detected")
          ; Debug.Trace("Wheels of Lull: SKSE detected")
    Else
        HasSKSE = False
        iSKSE.setValue(0)
        WoL.Log(self, "Wheels of Lull: SKSE is not installed")
        ; Debug.Trace("Wheels of Lull: SKSE is not installed.")
    EndIf
    CheckLullVersion()
EndEvent

Function CheckLullVersion()
    CheckUserErrors()
    CheckOtherTrainwizMods()
    Int nVersion = (LullVersion.GetValue() as Int)
    fishVersion = 0
    if FishingAddonpresent.getValue()as int==1
        fishVersion = FishingAddonVersion.getValue() as int
        if fishVersion != oldFishVersion
        fishUpdate = true 
    Else
        fishUpdate=False
    endif 
    else 
        fishUpdate =false
    endif 
        if (sversion != nVersion) || fishUpdate
            WoL.Log(Self, "Updating Wheels of Lull from version "+sVersion+" to "+nversion)
            Debug.Trace("Updating Wheels of Lull from version "+sVersion+" to "+nversion)
        if fishUpdate
            WoL.Log(Self, "Updating Fishing Addon from version "+oldFishVersion+" to "+fishVersion)
                  Debug.Trace("Updating Fishing Addon from version "+oldFishVersion+" to "+fishVersion)
        endif 
        Update(nversion)
    else
        WoL.Log(Self, "Wheels of Lull is up to date.")
    endif 
EndFunction

Function Update(Int pNewVersion)
    if !perkUpdatedone 
        wol.log(self, "Adding lull-specific perks")
           playerRef.addPerk(ancientKnowledgeLull)
           wol.log(self,"Ancient knowledge variant added.")
           playerRef.addPerk(matchingsetLullHeavy)
           playerRef.addperk(matchingsetLullLight)
           wol.log(self,"Matching set perk variants added.")
      
        perkUpdatedone =true
    endif 
    If pNewVersion == 50100 || !Fixed510
        aForceEditorLocation = new Form[128]
        MovePersistentRefs(MovedRefs)
        If MQ01.IsRunning() || MQ01.IsCompleted()
            QuestStarted.Show()
        EndIf
        Fixed510 = True
    
        ;   elseIf pNewVersion == 50101 && !Fixed511
        ;    aForceEditorLocation = new Form[128]
        ;    MovePersistentRefs(MovedRefs)
        ;    Fixed511 = True
        
    else ;nothing specific hardcoded to change for this version but we still need to update since the versions dont match
        aForceEditorLocation = new Form[128]
        MovePersistentRefs(MovedRefs) 
    EndIf
    sversion = pNewVersion
    oldFishVersion = fishVersion
EndFunction

Function CheckUserErrors()
    If HasSKSE
        If IsPluginInstalled("WoLStartAt40.esp")
            Installed40.Show()
            WoL.Log(self, "Old start at Level 40 plugin detected! This plugin is incompatible and must be removed immediately.", 2)
        EndIf
        ;Else
        ;If (GetFormFromFile(0x00000000, "WoLStartAt40.esp") != None)
        ;   Installed40.Show()
        ; Debug.Trace("Wheels of Lull: Old start at Level 40 plugin detected! This plugin is incompatible and must be removed immediately.")
        ; EndIf
    EndIf
EndFunction

Function CheckOtherTrainwizMods()
    If HasSKSE
        wol.log(self,"Checking for other Trainwiz mods")
      ;  wol.Log("Checking for Brhuce.")
        If IsPluginInstalled("BrhuceLegacy.esp")
            hasBrhuce.setValue(1)
            WoL.Log(self, "Found Brhuce")
        else 
            hasBrhuce.setValue(0)
            wol.Log(self, "No Brhuce.")
        EndIf
        If IsPluginInstalled("MzarkWonders.esp")
            hasMzark.setValue(1)
            WoL.Log(self, "Found Mzark")
        else 
            hasMzark.setValue(0)
            wol.Log(self, "No Mzark.")
        EndIf
        
    else 
        debug.trace("Lull is scanning for other supported mods, ignore any papyrus errors related to getFormFromFile.")
        if game.getformFromFile(0x00004E1C, "BrhuceLegacy.esp") != none
            hasBrhuce.setValue(1)
            debug.trace("Brhuce installed")
        else 
            hasBrhuce.setValue(0)
        endif 
    EndIf
EndFunction
;this script section uses some of Chesko's general purpose array functions as well as "complete example scripts," both availible on the CK Wiki.
Function MovePersistentRefs(FormList akFormList)
    ArrayClear(aForceEditorLocation)
    Int iFLIndex = akFormList.GetSize()
    While iFLIndex
        iFLIndex -= 1
        ObjectReference kReference = akFormList.GetAt(iFLIndex) As ObjectReference
        ArrayAddForm(aForceEditorLocation, kReference)
        WoL.Log(self, "Added " + kReference.GetFormID() + " to move array.")
    EndWhile
    Int iArrayIndex = ArrayCount(aForceEditorLocation)
    While iArrayIndex
        iArrayIndex -= 1
        (aForceEditorLocation[iArrayIndex] as ObjectReference).MoveToMyEditorLocation()
        WoL.Log(self, "Moved " + aForceEditorLocation[iArrayIndex].GetFormID() + " to my editor location.")
    EndWhile
endFunction 

bool function ArrayAddForm(Form[] myArray, Form myForm)
;Adds a form to the first available element in the array.
 
    ;-----------\
    ;Description \  Author: Chesko
    ;----------------------------------------------------------------
    ;Adds a form to the first available element in the array.
 
    ;-------------\
    ;Return Values \
    ;----------------------------------------------------------------
    ;       false       =       Error (array full)
    ;       true        =       Success
 
    int i = 0
    ;notification("myArray.Length = " + myArray.Length)
    while i < myArray.Length
        if myArray[i] == none
            myArray[i] = myForm
            ;notification("Adding " + myForm + " to the array.")
            return true
        else
            i += 1
        endif
    endWhile
 
    return false
 
endFunction

 
function ArrayClear(Form[] myArray)
;Deletes the contents of this array.
 
    ;-----------\
    ;Description \  Author: Chesko
    ;----------------------------------------------------------------
    ;Deletes the contents of this array.
 
    ;-------------\
    ;Return Values \
    ;----------------------------------------------------------------
    ;       none
 
    int i = 0
    while i < myArray.Length
        myArray[i] = none
        i += 1
    endWhile
 
endFunction
 
 
int function ArrayCount(Form[] myArray)
;Counts the number of indices in this array that do not have a "none" type.
 
        ;-----------\
    ;Description \  Author: Chesko
    ;----------------------------------------------------------------
    ;Counts the number of indices in this array that do not have a "none" type.
 
    ;-------------\
    ;Return Values \
    ;----------------------------------------------------------------
    ;       int myCount = number of indicies that are not "none"
 
    int i = 0
    int myCount = 0
    while i < myArray.Length
        if myArray[i] != none
            myCount += 1
            i += 1
        else
            i += 1
        endif
    endWhile
 
    ;notification("MyCount = " + myCount)   
 
    return myCount
 
endFunction 