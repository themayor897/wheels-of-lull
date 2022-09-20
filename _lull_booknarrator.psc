ScriptName _Lull_BookNarrator extends ObjectReference

Message Property BookMessage auto
musictype property screamnarration auto
bool readOnce = false
int iBookMenu =0
Event OnRead()

    if readOnce
      iBookMenu= BookMessage.show()
    else 
      readOnce = true
    endif 
    if iBookMenu == 0
        screamnarration.Add()
    elseif iBookMenu == 1
        ;Player doesn't want the book read to them :(
    endif
    
endEvent 