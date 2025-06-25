"
Clase MoveManager: Se encarga de mover correctamente las naves, teniendo en cuenta bloqueos dados por efectos o por falta de combustible
"
Class {
	#name : 'MoveManager',
	#superclass : 'Object',
	#instVars : [
		'lapManager',
		'cardManager'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'creation' }
MoveManager class >> createWith: aLapManager and: aCardManager [

	^ self new intializeWith: aLapManager and: aCardManager
]

{ #category : 'method' }
MoveManager >> block: aShip by: timeout [

	aShip increaseTimeoutBy: timeout.
]

{ #category : 'method' }
MoveManager >> handleBlockOf: aShip with: steps [

	((aShip hasFuelFor: steps )not and: aShip isBlocked not) ifFalse: [
		^ self ].
	aShip increaseTimeoutBy: 2.
	aShip moveToFirstPosition.
	aShip refillFuel
]

{ #category : 'as yet unclassified' }
MoveManager >> handleally:aShip step:steps [
	
( aShip hasFuelFor: steps )not ifTrue:[aShip askforfuel] 
]

{ #category : 'initialize' }
MoveManager >> intializeWith: aLapManager and: aCardManager [
	cardManager := aCardManager.
	lapManager := aLapManager
]

{ #category : 'method' }
MoveManager >> move: aShip by: steps [

	| newSteps |
	newSteps := steps + (cardManager effectsFor: aShip).
	self handleally: aShip step: steps.
	self handleBlockOf: aShip with: steps.
	aShip attemptToMoveBy: steps. 
	lapManager handle: aShip
]

{ #category : 'method' }
MoveManager >> resetPosition: aShip [
	aShip moveToFirstPosition
]
