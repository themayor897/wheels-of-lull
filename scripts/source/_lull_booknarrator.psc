ScriptName _Lull_BookNarrator extends ObjectReference

Message Property BookMessage auto
musictype property screamnarration auto

Event OnRead()

	int iBookMenu = BookMessage.show()
	
	if iBookMenu == 0
		screamnarration.Add()
	elseif iBookMenu == 1
		;Player doesn't want the book read to them :(
	endif
	
endEvent 