Scriptname _lull_enableWailwayAccess extends ObjectReference  
ObjectReference Property accessBlocker Auto 
Message property ConsoleOffline Auto
Message property ConsoleOnline auto 
quest property wailwayQuest Auto
quest property hammarQuest auto 
message property AlreadyOpen Auto
bool doOnce =false
event OnActivate(ObjectReference akActionRef)
    if !doOnce
        if hammarQuest.getStage()>=21
            accessBlocker.disable()
            ConsoleOnline.show()
            if wailwayQuest.getStage()==11
                wailwayQuest.setObjectiveCompleted(11)
            endif 
            wailwayQuest.setStage(20)
            doOnce=true
        else 
            consoleOffline.show()
            wailwayQuest.setStage(10)
        endif 
    else 
        alreadyOpen.show()
    endif 
endevent 