Scriptname _Lull_MQ06_MemoryAppear extends ObjectReference  

;Modified 9.07.2021 by themayor897 - Moved up crashsound play command so it plays immidiately, added functions to enable backup important items, changed getplayer calls to playerref properties.

Actor Property PlayerRef Auto
Actor Property Memory auto
Quest Property MQ06 auto
ObjectReference Property light1 auto
Sound Property crashSound auto
Sound Property appearSound auto

Weapon Property UnwinderBase Auto
Weapon Property OhmBase Auto
Armor Property VisorBase Auto
ObjectReference Property Unwinder Auto
ObjectReference Property Ohm Auto
ObjectReference Property Visor Auto
GlobalVariable Property UEnabled Auto
GlobalVariable Property OEnabled Auto
GlobalVariable Property VEnabled Auto

bool doOnce = false


Event OnCellAttach()
    if(!doOnce)
        crashSound.Play(PlayerRef) ;Moved above wait command 9.7.21
        
        if PlayerRef.GetItemCount(VisorBase) < 1
            Visor.Enable()
            VEnabled.SetValue(1)
            WoL.Log(self, "Player missing visor, enabled backup.")
        endif
        if PlayerRef.GetItemCount(OhmBase) < 1
            Ohm.Enable()
            OEnabled.SetValue(1)
            WoL.Log(self, "Player missing Ohm's Rod, enabled backup.")
        endif
        if PlayerRef.GetItemCount(UnwinderBase) < 1
            Unwinder.Enable()
            UEnabled.SetValue(1)
            WoL.Log(self, "Player missing Unwinder, enabled backup.")
        EndIf
        
        Utility.Wait(2)
        MQ06.SetStage(24)
        Game.ClearPrison()
        Utility.Wait(10)
        Memory.EnableNoWait()
        light1.EnableNoWait()
        appearSound.Play(PlayerRef)
        WoL.Log(self, "Memory enabled, approaching player")
        doOnce = true
    else
        WoL.Log(self, "Player re-entered LullBottom initial cell")
    endif
EndEvent