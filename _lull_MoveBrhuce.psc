Scriptname _lull_MoveBrhuce extends ObjectReference  
ObjectReference property brhuceWaitSpot Auto
GlobalVariable property hasBrhuce auto 
GlobalVariable property metBrhuce auto 
message property BrhuceWait auto 
quest property pDialogueFollower auto
actor property playerRef auto 
event OnTriggerEnter(ObjectReference akActionRef)
   if hasBrhuce.getValue()==1 
    Actor tmpRef = akActionRef as Actor
    if !tmpRef || tmpRef==playerRef ; get out if not an actor
        return
    endif
    actor brhuceRef = game.getformFromFile(0x00004E1C, "BrhuceLegacy.esp") as actor 
    if tmpRef == brhuceRef
        metBrhuce.SetValue(1)
        brhuceWait.show()
        brhuceRef.moveTo(brhuceWaitSpot)
        (pDialogueFollower as dialoguefollowerscript).FollowerWait()
    endif 
   endif 
endevent 