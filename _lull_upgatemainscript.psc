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
ReferenceAlias Property currentAnimal auto
ReferenceAlias Property currentFollower auto

Event OnActivate(ObjectReference akActionRef)
    actor animal = currentAnimal.getReference() as actor
    actor follower = currentfollower.getReference() as actor
    int destgate = destinationGate.getvalue() as int
    int gateFail = Utility.RandomInt(0, 4)
    if(gateFail == 2 && !deepSea.IsCompleted())
        PlayerRef.MoveTo(gateMarker6)
        _Lull_UpgateDeepSea01.show()
        If animal 
            animal.MoveTo(gateMarker6Pet)
            animal.stopCombat()
        endif 
        if follower
            follower.moveTo(gateMarker6Follower)
            follower.stopCombat()
        endif 
    else
        if(destgate == 0)
            _Lull_UpgateDeepSea02.show()
        elseif(destgate == 1)
            PlayerRef.MoveTo(gateMarker1)
            If animal 
                animal.MoveTo(gateMarker1Pet)
                animal.stopCombat()
            endif 
            if follower
                follower.moveTo(gateMarker1Follower)
                follower.stopCombat()
            endif             
        elseif(destgate == 2)
            PlayerRef.MoveTo(gateMarker2)
            If animal 
                animal.MoveTo(gateMarker2Pet)
                animal.stopCombat()
            endif 
            if follower
                follower.moveTo(gateMarker2Follower)
                follower.stopCombat()
            endif             
        elseif(destgate == 3)
            PlayerRef.MoveTo(gateMarker3)
            If animal 
                animal.MoveTo(gateMarker3Pet)
                animal.stopCombat()
            endif 
            if follower
                follower.moveTo(gateMarker3Follower)
                follower.stopCombat()
            endif             
        elseif(destgate == 4)
            PlayerRef.MoveTo(gateMarker4)
            If animal 
                animal.MoveTo(gateMarker4Pet)
                animal.stopCombat()
            endif 
            if follower
                follower.moveTo(gateMarker4Follower)
                follower.stopCombat()
            endif             
        elseif(destgate == 5)
            PlayerRef.MoveTo(gateMarker5)
            If animal 
                animal.MoveTo(gateMarker5Pet)
                animal.stopCombat()
            endif 
            if follower
                follower.moveTo(gateMarker5Follower)
                follower.stopCombat()
            endif             
        endif
    endif
EndEvent 