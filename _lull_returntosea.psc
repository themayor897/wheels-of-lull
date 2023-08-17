Scriptname _Lull_ReturnToSea extends ObjectReference  
ObjectReference Property returnMarker auto
Quest Property deepSea auto
Actor property playerRef auto
ReferenceAlias Property currentAnimal auto
ReferenceAlias Property currentFollower auto
Event OnActivate(ObjectReference akActionRef)
    deepSea.SetObjectiveCompleted(7)
    deepSea.CompleteQuest() 
    actor animal = currentAnimal.getReference() as actor
    actor follower = currentfollower.getReference() as actor
   If animal 
       animal.MoveTo(returnMarker, -200)
            animal.stopCombat()
        endif 
        if follower
            follower.moveTo(returnMarker, 200)
            follower.stopCombat()
        endif 
    playerRef.Moveto(returnMarker)
   
EndEvent
