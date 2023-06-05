;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname PF__Lull_NuminarTravelToGive_04591871 Extends Package Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(Actor akActor)
;BEGIN CODE

WoL.Log(self, "Numinar arrived at speech marker")
 if playerRef.getParentCell()==LullMor01 && !numinarSpeech.isPlaying()
        wol.log(self, "player is in cell, beginning speech.")
        numinarSpeech.forceStart()
    else 
        self.registerforsingleupdate(3)
    endif 

;END CODE


EndFunction
;END FRAGMENT
event onUpdate()
    if playerRef.getParentCell()==LullMor01 && !numinarSpeech.isPlaying()
        wol.log(self, "player is in cell, beginning speech.")
        unregisterforupdate()
        numinarSpeech.forceStart()
    else 
        ;     wol.log(self, "player not in cell yet, waiting.")
        self.registerforsingleupdate(3)
    endif 
endevent 
;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property numinarSpeech  Auto  
actor property playerRef auto 
cell property LullMor01 auto