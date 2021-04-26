scriptName _Lull_TrapTriggerTimeInterval extends TrapTriggerBase
{Modified version of vanilla script for wheels of Lull piston off-switch MCM option}

;
;
;========================================================

float property initialDelay = 0.1 Auto
float property initialDelayRange = 0.1 auto

float property triggerInterval = 15.0 auto
{how often to trigger the trap, EG: every 15.0 seconds
	default = 15.0}
float property triggerIntervalRange = 3.0 auto
{random amount of time to increase/decrease the triggerInterval
	default = 3.0}
;NOTE: make sure that triggerInterval cannot be 0 or less.
	
float lowerTriggerIntervalRange
bool property isLoaded = false auto hidden
Cell property myParentCell auto hidden

ObjectReference Property OffSwitch Auto

Function OnInit()
	RegisterForModEvent("_Lull_FoundryOffSwitch", "OnMyCustomEvent")
EndFunction

auto state TimedFireState

	event OnBeginState()
		myParentCell = self.getParentCell()
		if myParentCell.isAttached()
			isLoaded = true
			lowerTriggerIntervalRange = (0.0 - triggerIntervalRange)
			registerForSingleUpdate(math.abs(initialDelay + utility.RandomFloat(0.0, InitialDelayRange)))
		else
			isLoaded = false
		endif
	EndEvent

	event onCellAttach()
; 		debug.Trace(self + ": should be loaded")
		isLoaded = true
		lowerTriggerIntervalRange = (0.0 - triggerIntervalRange)
		myParentCell = self.getParentCell()
		registerForSingleUpdate(math.abs(initialDelay + utility.RandomFloat(0.0, InitialDelayRange)))
	endEvent

	event onCellDetach()
; 		debug.Trace(self + ": should be unloaded")
		isLoaded = false
	endEvent


	event onUpdate()
; 		debug.Trace(self + ": has ran an update at timestamp: " + utility.getCurrentRealTime())
		if myParentCell.isAttached()
			utility.wait(0.0)
			self.activate(self)
; 			debug.Trace(self + ": has found that 3d is loaded")
			registerForSingleUpdate(triggerInterval + utility.RandomFloat(lowerTriggerIntervalRange, triggerIntervalRange))
		else
; 			debug.Trace(self + ": has found that 3d is NOT loaded")
			isLoaded = false
		endif
	endEvent
endState

state Inactive
	Event OnBeginState()
		UnregisterforUpdate()
	EndEvent
	;Trap is inactive
endState


event onCellAttach()
endEvent

event onCellDetach()
endEvent

Event OnMyCustomEvent(Form theForm)
	If theForm == OffSwitch
		If GetState() == ("TimedFireState")
			GoToState("Inactive")
			WoL.Log(self, "Off switch event recieved from" + (OffSwitch.GetParentCell() as string) + "switch. Turning off pistons in" + (self.GetParentCell() as string))
		elseif GetState() == ("Inactive")
			GoToState("TimedFireState")
			WoL.Log(self, "On switch event recieved from" + (OffSwitch.GetParentCell() as string) + "switch. Turning on pistons in" + (self.GetParentCell() as string))
		EndIf
	EndIf
EndEvent
