Scriptname _Lull_Update extends Quest  

GlobalVariable Property LullVersion Auto

Int Property sVersion = 50001 Auto Hidden ;translates to 5.0.1, adding an additional 0 before each of the second numbers.

FormList Property MovedRefs Auto
Form[] aForceEditorLocation

;For version 5.1.0
Quest Property MQ01 Auto
Message Property QuestStarted Auto
Bool Fixed510

Event OnInit()
	CheckLullVersion()
EndEvent

Function CheckLullVersion()
	Int nVersion = (LullVersion.GetValue() as Int)
	if sversion != nVersion
		WoL.Log(Self, "Updating Wheels of Lull from version "+sVersion+" to "+nversion)
		Debug.Trace("Updating Wheels of Lull from version "+sVersion+" to "+nversion)
		Update(nversion)
	else
		WoL.Log(Self, "Wheels of Lull is up to date.")
	endif 
EndFunction

Function Update(Int pNewVersion)
	If pNewVersion == 50100 || !Fixed510
		aForceEditorLocation = new Form[128]
		MovePersistentRefs(MovedRefs)
		If MQ01.IsRunning() || MQ01.IsCompleted()
			QuestStarted.Show()
		EndIf
		sVersion = pNewVersion
		Fixed510 = True
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
	;Description \	Author: Chesko
	;----------------------------------------------------------------
	;Adds a form to the first available element in the array.
 
	;-------------\
	;Return Values \
	;----------------------------------------------------------------
	;		false		=		Error (array full)
	;		true		=		Success
 
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
	;Description \	Author: Chesko
	;----------------------------------------------------------------
	;Deletes the contents of this array.
 
	;-------------\
	;Return Values \
	;----------------------------------------------------------------
	;		none
 
	int i = 0
	while i < myArray.Length
		myArray[i] = none
		i += 1
	endWhile
 
endFunction
 
 
int function ArrayCount(Form[] myArray)
;Counts the number of indices in this array that do not have a "none" type.
 
        ;-----------\
	;Description \	Author: Chesko
	;----------------------------------------------------------------
	;Counts the number of indices in this array that do not have a "none" type.
 
	;-------------\
	;Return Values \
	;----------------------------------------------------------------
	;		int myCount = number of indicies that are not "none"
 
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