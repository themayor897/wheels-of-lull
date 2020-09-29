Scriptname _Lull_Cave_DisableLever extends ObjectReference  

ObjectReference Property marker1 auto
ObjectReference Property marker2 auto
ObjectReference Property marker3 auto
ObjectReference Property marker4 auto
bool isReady = FALSE

Event OnActivate(ObjectReference akActionRef)
  if(!isReady)
	isReady = TRUE
	marker1.DisableNoWait()
	marker2.DisableNoWait()
	marker3.DisableNoWait()
	marker4.DisableNoWait()
	Utility.Wait(4)
	marker1.EnableNoWait()
	marker2.EnableNoWait()
	marker3.EnableNoWait()
	marker4.EnableNoWait()
	isReady = FALSE
 endif
EndEvent