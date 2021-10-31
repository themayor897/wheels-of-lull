Scriptname _Lull_Bottom_Masspit extends ObjectReference  
;updated 8/13/21 vitrial, make clearable. 
Actor Property masscroft auto
Actor Property PlayerRef auto

ObjectReference Property collisionWall auto
ObjectReference Property resetMarker auto
ObjectReference Property grate auto
ObjectReference Property startMarker auto

Armor Property lull_securityPack auto

Sound Property massScream auto
Sound Property massDie auto

GlobalVariable property NumFalls auto
GlobalVariable property TotalFalls auto
GlobalVariable property HitDamage auto
Location property lullBottomLocation auto
MusicType Property massMusic auto

;--------------------

Event OnTriggerEnter(ObjectReference akActionRef)
    if(akActionRef == masscroft)
        NumFalls.Mod(1.0)
        float fCount = NumFalls.GetValue() as Int
        float Total = TotalFalls.GetValue() as Int
        float hDamage = HitDamage.GetValue() as Int
        if(fcount < Total)
            Masscroft.DamageAV("Health", hDamage)
            massScream.Play(PlayerRef)
            masscroft.MoveTo(resetMarker)
            Masscroft.Resurrect()
            Masscroft.DamageAV("Health", (fcount*hDamage))
            masscroft.StartCombat(PlayerRef)
            WoL.Log(self, "Fall registered on Masscroft." + (fCount as String) + "/" + (Total as String) + "falls.")
            if masscroft.isDead() && !masscroft.isDisabled()
                WoL.Log(self, "Masscroft died prematurely! Hits:" + (fCount as String) + ". Resurrecting", 1)
                Masscroft.resurrect()
            endif
        else
            ActorBase masscroftBase = masscroft.GetBaseObject() as ActorBase
            if (masscroftBase.IsInvulnerable())
                masscroftBase.SetInvulnerable(false)
            endif
            masscroft.killEssential(playerRef)
            masscroft.DisableNoWait()
            massMusic.Remove()
            massDie.Play(PlayerRef)
            Game.ShakeCamera()
            grate.DisableNoWait()
            collisionWall.DisableNoWait()
            Masscroft.UnregisterForUpdate()
            lullBottomLocation.setCleared(true)
            WoL.Log(self, "Masscroft defeated, the way is open.") 
        endif
    elseif (akActionRef == PlayerRef)
        if PlayerRef.IsEquipped(lull_securityPack)
            PlayerRef.MoveTo(startMarker)
            WoL.Log(self, "Player fell into pit while wearing Security pack. Returning to start marker...")
        else 
            PlayerRef.Kill()
            WoL.Log(self, "Player fell into pit with no security pack! Instant death...")
        endif
    endif

EndEvent 