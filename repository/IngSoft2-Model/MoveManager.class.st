"
Clase MoveManager: Se encarga de mover correctamente las naves, teniendo en cuenta bloqueos dados por efectos o por falta de combustible
"
Class {
	#name : 'MoveManager',
	#superclass : 'Object',
	#instVars : [
		'lapManager'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'creation' }
MoveManager class >> createWith: aLapManager [
	^self new intializeWith: aLapManager.
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

{ #category : 'initialize' }
MoveManager >> intializeWith: aLapManager [
	lapManager := aLapManager.
]

{ #category : 'method' }
MoveManager >> move: aShip by: steps [

	self handleBlockOf: aShip with: steps.
	aShip isBlocked ifTrue:[aShip reduceTimeout. ^self].
	aShip moveBy: steps.
	aShip consumeFuel: steps.
	lapManager handle: aShip.

]

{ #category : 'method' }
MoveManager >> resetPosition: aShip [
	aShip moveToFirstPosition
]
