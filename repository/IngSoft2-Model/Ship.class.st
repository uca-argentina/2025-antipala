"
clase Ship: Se encarga de conocer una nave, no puede hacer mucho sin un MoveManager.
"
Class {
	#name : 'Ship',
	#superclass : 'Object',
	#instVars : [
		'position',
		'fuel',
		'id',
		'maxfuel',
		'timeout',
		'laps'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Ship class >> createWhithId: anId andWithFuel: anFuel [ 
	^self new initializewith: anId andfuel: anFuel.
]

{ #category : 'methods' }
Ship >> changeLapsBy: someLaps [
	laps:=laps+someLaps max:0.
]

{ #category : 'methods' }
Ship >> consumeFuel:amount [
   
    fuel := fuel - amount.
]

{ #category : 'private - testing' }
Ship >> fuel [
	"este metodo solo debe ser usado por los tests"

	^ fuel
]

{ #category : 'methods' }
Ship >> hasFuelFor: steps [
   
    ^ fuel >= (steps abs).
]

{ #category : 'private - testing' }
Ship >> id [
	"este metodo solo debe ser usado por los tests"
	^ id
]

{ #category : 'methods' }
Ship >> increaseTimeoutBy: anumber [
	timeout := timeout + anumber

]

{ #category : 'initialize' }
Ship >> initializewith: anId andfuel: afuel [
	fuel:=afuel.
	maxfuel:=afuel.
	id:=anId. 
	position:=0.
	timeout:=0.
	laps:=0.
	
]

{ #category : 'methods' }
Ship >> isAhead: otherShipPosition with: otherShipLaps [
    laps < otherShipLaps ifTrue: [ ^ true ].
    laps > otherShipLaps ifTrue: [ ^ false ].
    ^ position < otherShipPosition.

	
]

{ #category : 'methods' }
Ship >> isAheadOf: aSecondShip [

	^ aSecondShip isAhead: position with: laps.
	
]

{ #category : 'methods' }
Ship >> isAt: aPosition [
	^position =aPosition 
]

{ #category : 'methods' }
Ship >> isAtLap: lap [
	"este metodo solo debe ser usado por los tests"

	^ laps = lap
]

{ #category : 'methods' }
Ship >> isBlocked [
	^ timeout > 0.
]

{ #category : 'private - testing' }
Ship >> isWithTimeout: amount [
	"este metodo solo debe ser usado por los tests"

	^ timeout = amount
]

{ #category : 'methods' }
Ship >> lapsToApplyWith: boardSize [
    ^ position // boardSize.
]

{ #category : 'methods' }
Ship >> moveBy: steps [
	
	position := position + steps
]

{ #category : 'methods' }
Ship >> moveToFirstPosition [

	position:=0.
]

{ #category : 'methods' }
Ship >> reduceTimeout [

	timeout := timeout - 1 max: 0.
]

{ #category : 'methods' }
Ship >> refillFuel [
    fuel := maxfuel .
]
