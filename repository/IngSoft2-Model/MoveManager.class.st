"
Clase MoveManager: Se encarga de mover correctamente las naves, teniendo en cuenta bloqueos dados por efectos o por falta de combustible
"
Class {
	#name : 'MoveManager',
	#superclass : 'Object',
	#instVars : [
		'lapManager',
		'cardManager',
		'boardSize'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'creation' }
MoveManager class >> createWith: aBoardSize and: aCardManager [
	aCardManager ifNil: [ self error: 'The MoveManager must have a CardManager.' ].
	aBoardSize  <4 ifTrue: [ self error: 'The BoardSize must be equal or greater than 4 squares.' ]. 
	^ self new intializeWith: aBoardSize and: aCardManager
]

{ #category : 'method' }
MoveManager >> askforally: aShip step: steps [

	(aShip hasFuelFor: steps) ifFalse: [ cardManager handleally: aShip  fuel: (aShip fuelNededFor: steps)].
]

{ #category : 'method' }
MoveManager >> block: aShip by: timeout [

	aShip increaseTimeoutBy: timeout.
]

{ #category : 'method' }
MoveManager >> handleBlockOf: aShip with: steps [

((aShip hasFuelFor: steps) or: aShip isBlocked) ifTrue: [ ^ self ].
	aShip increaseTimeoutBy: 2.
	aShip moveToFirstPosition.
	aShip refillFuel
]

{ #category : 'accessing' }
MoveManager >> handleLaps: aship [

	| lapsDoneByTheShip |
	lapsDoneByTheShip := aship lapsToApplyWith: boardSize.
	lapsDoneByTheShip = 0 ifTrue: [ ^ self ].
	aship changeLapsBy: lapsDoneByTheShip.
	aship moveBy: boardSize * lapsDoneByTheShip negated + 1
]

{ #category : 'initialize' }
MoveManager >> intializeWith: aBoardSize and: aCardManager [
	cardManager := aCardManager.
	boardSize:= aBoardSize.
]

{ #category : 'method' }
MoveManager >> move: aShip by: steps [

	| newSteps |
	newSteps := steps + (cardManager throwEffectsFor: aShip).
	self askforally:aShip  step:steps.
	self handleBlockOf: aShip with: newSteps.
	aShip attemptToMoveBy: newSteps. 
	self handleLaps: aShip 
]

{ #category : 'method' }
MoveManager >> resetPosition: aShip [
	aShip moveToFirstPosition
]
