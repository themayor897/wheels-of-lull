Scriptname _Lull_sybandisJumpscare extends ObjectReference 
globalvariable property tookLantern auto
sound property sybandisNoise auto
ObjectReference property eye Auto
Actor Property playerRef auto
event OnTriggerEnter(ObjectReference akActionRef)
    if akActionRef == playerRef
        int chance = Utility.RandomInt(0, 400) ;The eye should be extremely unlikely to appear
        if  tookLantern.getValue() >=1
        if chance ==333 
              eye.enable()
              sybandisNoise.Play(playerRef as ObjectReference)
              utility.wait(2)
              eye.disable()
          EndIf
          self.disable()
      endif
    EndIf       
EndEvent