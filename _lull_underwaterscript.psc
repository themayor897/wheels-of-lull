Scriptname _Lull_underwaterScript extends ObjectReference  

;modified 4.25.21 by themayor87. Added logging and swapped getplayer call
;modified 9.09.21 by themayor87. Added check to ensure player is in the Underwater02 cell before running kill function and unequip torch function.

Light Property playerTorch auto
Armor Property divingHelm auto
Cell Property Underwater Auto
Actor Property PlayerRef auto

Event OnCellAttach()
    RegisterForSingleUpdate(0.5)
    ActorBase playerBase = playerRef.GetBaseObject() as ActorBase
    WoL.Log(self, "Underwater02 script attached, registered for update")
    if playerBase.isInvulnerable()
        WoL.Log(self, "Player is invulnerable, ignore any papyrus errors about failing to kill player.")
    endif 
EndEvent

Event OnCellDetach()
    UnregisterForUpdate()
    WoL.Log(self, "Underwater02 script detached, unregistered for update")
EndEvent

Event OnUpdate()
    if PlayerRef.GetParentCell() == Underwater
        RegisterForSingleUpdate(0.5)
        if (!PlayerRef.IsEquipped(divingHelm)) 
            PlayerRef.Kill()
        endif 
        if (PlayerRef.IsEquipped(playerTorch))
            PlayerRef.UnequipItem(playerTorch)
        endif
    else
        UnregisterForUpdate()
        WoL.Log(self, "Underwater cell did not detach properly, force ending Underwater Checker.", 1)
    endif
EndEvent