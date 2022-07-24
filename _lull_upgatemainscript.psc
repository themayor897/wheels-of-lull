Scriptname _lull_UpgateMainScript extends ObjectReference  

;Modified by 4.25.21 by themayor897. Changed to playerref, removed excess getvalue calls

GlobalVariable Property destinationGate auto
ObjectReference Property gateMarker1 auto
ObjectReference Property gateMarker1Pet auto
ObjectReference Property gateMarker1Follower auto
ObjectReference Property gateMarker2 auto
ObjectReference Property gateMarker2Pet auto
ObjectReference Property gateMarker2Follower auto
ObjectReference Property gateMarker3 auto
ObjectReference Property gateMarker3Pet auto
ObjectReference Property gateMarker3Follower auto
ObjectReference Property gateMarker4 auto
ObjectReference Property gateMarker4Pet auto
ObjectReference Property gateMarker4Follower auto
ObjectReference Property gateMarker5 auto
ObjectReference Property gateMarker5Pet auto
ObjectReference Property gateMarker5Follower auto
ObjectReference Property gateMarker6 auto
ObjectReference Property gateMarker6Pet auto
ObjectReference Property gateMarker6Follower auto
Quest Property deepSea auto

Message Property _Lull_UpgateDeepSea01 auto
Message Property _Lull_UpgateDeepSea02 auto

Actor Property PlayerRef auto
Actor Property currentAnimal auto
Actor Property currentFollower auto
Event OnActivate(ObjectReference akActionRef)

    int destgate = destinationGate.getvalue() as int
    int gateFail = Utility.RandomInt(0, 4)
    if(gateFail == 2 && !deepSea.IsCompleted())
        PlayerRef.MoveTo(gateMarker6)
        _Lull_UpgateDeepSea01.show()
    If currentAnimal 
        currentAnimal.MoveTo(gateMarker6Pet)
        currentAnimal.stopCombat()
    endif 
    if currentFollower
        currentFollower.moveTo(gateMarker6Follower)
        currentFollower.stopCombat()
    endif 
    else
        if(destgate == 0)
            _Lull_UpgateDeepSea02.show()
        elseif(destgate == 1)
            PlayerRef.MoveTo(gateMarker1)
            If currentAnimal 
                currentAnimal.MoveTo(gateMarker1Pet)
                currentAnimal.stopCombat()
            endif 
            if currentFollower
                currentFollower.moveTo(gateMarker1Follower)
                currentFollower.stopCombat()
            endif             
        elseif(destgate == 2)
            PlayerRef.MoveTo(gateMarker2)
            If currentAnimal 
                currentAnimal.MoveTo(gateMarker2Pet)
                currentAnimal.stopCombat()
            endif 
            if currentFollower
                currentFollower.moveTo(gateMarker2Follower)
                currentFollower.stopCombat()
            endif             
        elseif(destgate == 3)
            PlayerRef.MoveTo(gateMarker3)
            If currentAnimal 
                currentAnimal.MoveTo(gateMarker3Pet)
                currentAnimal.stopCombat()
            endif 
            if currentFollower
                currentFollower.moveTo(gateMarker3Follower)
                currentFollower.stopCombat()
            endif             
        elseif(destgate == 4)
            PlayerRef.MoveTo(gateMarker4)
            If currentAnimal 
                currentAnimal.MoveTo(gateMarker4Pet)
                currentAnimal.stopCombat()
            endif 
            if currentFollower
                currentFollower.moveTo(gateMarker4Follower)
                currentFollower.stopCombat()
            endif             
        elseif(destgate == 5)
            PlayerRef.MoveTo(gateMarker5)
            If currentAnimal 
                currentAnimal.MoveTo(gateMarker5Pet)
                currentAnimal.stopCombat()
            endif 
            if currentFollower
                currentFollower.moveTo(gateMarker5Follower)
                currentFollower.stopCombat()
            endif             
        endif
    endif
EndEvent 