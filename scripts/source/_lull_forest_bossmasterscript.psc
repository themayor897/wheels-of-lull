Scriptname _Lull_Forest_BossMasterScript extends Actor

;modified 4.19.21 by themayor897 - added logging, PlayerRef, changed type from ObjectReference to Actor, switched "meboss" property to self or removed it.
;modified 8/10/21 vitrial. Add rubble to block door after death
;modified 8/22/21 themayor897 - removed rubble and fake door properties that were never published.Those objects are now enable parented to the real door.
ActorBase Property familyMan auto
ActorBase Property tho auto

;Platforms where familymen spawn
ObjectReference Property spawnPlatform1 auto
ObjectReference Property spawnPlatform2 auto
ObjectReference Property spawnPlatform3 auto
ObjectReference Property spawnPlatform4 auto
ObjectReference Property spawnPlatform5 auto

GlobalVariable Property isInCoffin auto
Spell Property effectSpellCoffin auto
ObjectReference Property coffin auto 
ObjectReference Property coffinHider auto ;Place he teleports to when "hiding" in his coffin

Activator Property teleportEffect auto
Spell Property explosionSpell auto
int numHits = 0;

Spell Property attackSpell auto;
bool isInPlay
bool assignOnce = false
float healthSince = 0.0;
float currentHealth = 0.0;
Sound Property thoMad auto
Enchantment Property goverisUnwind auto
Weapon Property goverisUnwinder auto
ObjectReference property bossdoor auto
ImagespaceModifier Property blackOut auto
Topic Property FyrTopic auto
Activator Property xMarkerActivator auto
Actor Property fyr auto
ObjectReference Property playerMarker auto
MusicType Property bossMusic auto
Quest Property MQ05 auto

Actor Property Numinar auto
ObjectReference Property numinarmarker auto

ObjectReference Property PlayerRef auto

Event OnLoad()
    RegisterForSingleUpdate(15)
    isInPlay = TRUE
    healthSince = self.GetBaseActorValue("Health")
    if(!assignOnce) ;moved up from top of OnHit event, 4.19.20 by themayor897. Testing forthcoming.
        self.SetActorValue("Health", 1700)
        healthSince = self.GetActorValue("Health")
        assignOnce = TRUE
    endif
EndEvent

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
    Weapon akWeapon = akSource as Weapon
    currentHealth = self.GetActorValue("Health")
    if(akWeapon == goverisUnwinder)
        if(!isInPlay)
            UnregisterForUpdate()
            self.RemoveSpell(effectSpellCoffin)
            isInPlay = TRUE
            tho.SetInvulnerable(false)
            SetDontMove(false)
            RegisterForSingleUpdate(15)
            thoMad.Play(PlayerRef)
        endif
    endif
    if(healthSince - currentHealth >= 200)
        if(isInPlay)
            isInPlay = FALSE
            healthSince = self.GetActorValue("Health")
            PlaceAtme(teleportEffect, 1)
            self.AddSpell(effectSpellCoffin)
            tho.SetInvulnerable(true)
            SetDontMove()
            UnregisterForUpdate()
            spawnPlatform1.PlaceAtMe(teleportEffect, 1)
            spawnPlatform1.PlaceAtMe(familyMan, 1)
            spawnPlatform2.PlaceAtMe(teleportEffect, 1)
            spawnPlatform2.PlaceAtMe(familyMan, 1)
            spawnPlatform3.PlaceAtMe(teleportEffect, 1)
            spawnPlatform3.PlaceAtMe(familyMan, 1)
            spawnPlatform4.PlaceAtMe(teleportEffect, 1)
            spawnPlatform4.PlaceAtMe(familyMan, 1)
            spawnPlatform5.PlaceAtMe(teleportEffect, 1)
            spawnPlatform5.PlaceAtMe(familyMan, 1)
            RegisterForSingleUpdate(15)
        endif
    endif
EndEvent

Event OnUpdate()
    if(isInPlay)
        Debug.SendAnimationEvent(self, "idleStartScan")
        attackSpell.Cast(self, PlayerRef)
        RegisterForSingleUpdate(15)
    else
        self.RestoreActorValue("Health", 200)
        self.RemoveSpell(effectSpellCoffin)
        explosionSpell.Cast(self, PlayerRef)
        tho.SetInvulnerable(false)
        SetDontMove(false)
        isInPlay = TRUE
        RegisterForSingleUpdate(15)
    endif
EndEvent

Event OnDeath(Actor akKiller)
    WoL.Log(self, "Tho dead, scene commencing...")
    bossMusic.Remove()
    UnregisterForUpdate()
    Game.DisablePlayerControls()
    explosionSpell.Cast(self, PlayerRef)
    Game.ShakeCamera(PlayerRef, 1, 10)
    Utility.Wait(1)
    explosionSpell.Cast(spawnPlatform1, PlayerRef)
    Utility.Wait(1)
    explosionSpell.Cast(spawnPlatform2, PlayerRef)
    Utility.Wait(1)
    explosionSpell.Cast(spawnPlatform3, PlayerRef)
    Utility.Wait(1)
    explosionSpell.Cast(spawnPlatform4, PlayerRef)
    Utility.Wait(1)
    explosionSpell.Cast(spawnPlatform5, PlayerRef)  
    blackOut.Apply()
    Utility.Wait(4)
    ObjectReference fyrSay = PlayerRef.PlaceAtMe(xMarkerActivator)
    fyrSay.Say(FyrTopic, fyr, true)
    Utility.Wait(6)
    MQ05.SetStage(15)
    PlayerRef.MoveTo(playerMarker)
    numinar.moveto(numinarmarker)
    blackout.Remove()
    Game.EnablePlayerControls()
    bossdoor.disable()
endEvent