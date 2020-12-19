Scriptname _Lull_OhmDisabler extends ObjectReference  
{Disables an object on translationcomplete()}

Event OnTranslationComplete()
	self.disablenowait()
EndEvent

