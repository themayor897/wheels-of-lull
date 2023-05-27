Scriptname _lull_enableWailwayAccess extends ObjectReference  
ObjectReference Property accessBlocker Auto 
Message property ConsoleOffline Auto
Message property ConsoleOnline auto 
quest property wailwayQuest Auto
quest property hammarQuest auto 
message property AlreadyOpen Auto
bool doOnce =false
bool errorShown = false
event OnActivate(ObjectReference akActionRef)
    if !doOnce
        if !wailwayQuest.isRunning()
            wailwayQuest.start()
            wol.log(self, "wailway quest not running, starting.")
        endif
        if hammarQuest.getStage()>=21
            accessBlocker.disable()
            ConsoleOnline.show()
            if wailwayQuest.getStage()==11
                wailwayQuest.setObjectiveCompleted(11)
            endif 
            wol.log(self, "wailway opened.")
            wailwayQuest.setStage(20)
            wailwayQuest.setObjectiveDisplayed(20)
            doOnce=true
        else 
            consoleOffline.show()
            if !errorShown
            wailwayQuest.setStage(10)
            wailwayQuest.setObjectiveDisplayed(10)
            errorShown=True
            wol.log(self, "wailway quest set to stage 10.")
        endif 

        endif 
    else 
        alreadyOpen.show()
    endif 
endevent 