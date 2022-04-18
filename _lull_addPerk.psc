Scriptname _lull_addPerk extends ObjectReference  
Perk Property lullPerk Auto
Message property perkMessage auto
Actor Property PlayerRef Auto
event OnActivate(ObjectReference akActionRef)
    if (!playerRef.hasPerk(lullPerk))
            playerRef.addPerk(lullPerk)
             perkMessage.show()
         EndIf
     endevent