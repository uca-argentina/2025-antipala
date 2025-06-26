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
		'laps',
		'ally',
		'cards'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'creation' }
Ship class >> createWhithId: anId andWithFuel: anFuel [
    (anId isNil or: [ anId <= 0 ]) ifTrue: [ self error: 'The Ship ID must be a positive number' ].
	anFuel < 0 ifTrue: [ self error: 'El fuel must be positive' ]. 
	^self new initializewith: anId andfuel: anFuel.
]

{ #category : 'methods' }
Ship >> addCard: aCard [
	cards add:aCard .
]

{ #category : 'methods' }
Ship >> attemptToMoveBy: steps [
	self isBlocked 
		ifTrue: [ ^ self reduceTimeout ] 
		ifFalse: [
			self moveBy: steps.
			self consumeFuel: steps
		].
]

{ #category : 'methods' }
Ship >> changeLapsBy: someLaps [
	laps:=laps+someLaps max:0.
]

{ #category : 'methods' }
Ship >> changeMaxFuelBy: quanty [

	maxfuel := maxfuel + quanty
]

{ #category : 'methods' }
Ship >> consumeFuel:amount [
   
    fuel := fuel - amount.
]

{ #category : 'methods' }
Ship >> donatefuel:steps ship:aShip [
aShip givefuel: ((steps) min:fuel).
self consumeFuel: ((steps) min:fuel).
]

{ #category : 'private accessing' }
Ship >> fuel [

	^ fuel
]

{ #category : 'initialize' }
Ship >> fuelNededFor: steps [
	^ steps - fuel.
]

{ #category : 'methods' }
Ship >> givefuel:afuel [
fuel:=fuel+afuel.
]

{ #category : 'methods' }
Ship >> hasFuelFor: steps [
   
    ^ fuel >= (steps abs).
]

{ #category : 'private accessing' }
Ship >> id [
	
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
	position:=1.
	timeout:=0.
	laps:=0.
	cards:= OrderedCollection new.
	
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

	^ position truncated = aPosition
]

{ #category : 'private - testing' }
Ship >> isAtLap: lap [

	^ laps = lap
]

{ #category : 'methods' }
Ship >> isBlocked [
	^ timeout > 0.
]

{ #category : 'private accessing' }
Ship >> isWithTimeout: amount [

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

	position:=1.
]

{ #category : 'accessing' }
Ship >> position [
	^  position truncated
]

{ #category : 'methods' }
Ship >> reduceTimeout [

	timeout := timeout - 1 max: 0.
]

{ #category : 'methods' }
Ship >> refillFuel [
    fuel := maxfuel .
]

{ #category : 'methods' }
Ship >> removeCard: aCard [
	| cardToDelete |
	cardToDelete:=cards detect: [:card | card = aCard  ] ifNone: [Error signal: 'The Ship Should have the card to play'].
	cards remove:cardToDelete.
]
