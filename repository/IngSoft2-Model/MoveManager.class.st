"
Clase MoveManager: Se encarga de mover correctamente las naves, teniendo en cuenta bloqueos dados por efectos o por falta de combustible
"
Class {
	#name : 'MoveManager',
	#superclass : 'Object',
	#instVars : [
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
MoveManager >> handleLaps: aShip [

	| lapsDoneByTheShip |
	aShip position < 1 ifTrue: [ ^ self handleRetreatBelowTheStartOf: aShip ].
	lapsDoneByTheShip := aShip lapsToApplyWith: boardSize.
	lapsDoneByTheShip = 0 ifTrue: [ ^ self ].
	aShip changeLapsBy: lapsDoneByTheShip.
	aShip moveBy: boardSize * lapsDoneByTheShip negated + 1
]

{ #category : 'accessing' }
MoveManager >> handleRetreatBelowTheStartOf: aShip [

	[ aShip position < 1 and: [ (aShip isAtLap: 0) not ] ] whileTrue: [
		aShip changeLapsBy: -1.
		aShip moveBy: boardSize - 1 ].
	aShip position < 1 ifTrue: [ aShip moveToFirstPosition ]
]

{ #category : 'initialize' }
MoveManager >> intializeWith: aBoardSize and: aCardManager [
	cardManager := aCardManager.
	boardSize:= aBoardSize.
]

{ #category : 'method' }
MoveManager >> move: aShip by: steps [

	self askforally: aShip step: steps.
	self handleBlockOf: aShip with: steps.
	aShip attemptToMoveBy: steps.
	self handleLaps: aShip
]

{ #category : 'as yet unclassified' }
MoveManager >> move: aShip byThrow: aThrow [ 
	self move: aShip by: aThrow + (cardManager throwEffectsFor: aShip)
]

{ #category : 'method' }
MoveManager >> resetPosition: aShip [
	aShip moveToFirstPosition
]
