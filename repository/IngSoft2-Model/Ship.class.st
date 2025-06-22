"
clase Ship: Se encarga de conocer una nave, de avisar al moveManager si se queda sin combustible y de manejar el numero de vueltas junto con LapManager
"
Class {
	#name : 'Ship',
	#superclass : 'Object',
	#instVars : [
		'position',
		'fuel',
		'id',
		'maxfuel',
		'lapmanger',
		'timeout',
		'laps'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Ship class >> createWhithId: anId andWithFuel: anFuel andwithlapmanager: anlapmanager [
	^self new initializewith:anId andfuel:anFuel andlapmanger:anlapmanager.
]

{ #category : 'methods' }
Ship >> changeLapsBy: someLaps [
	laps:=laps+someLaps max:0.
]

{ #category : 'private - methods' }
Ship >> consumeFuel:amount [
   
    fuel := fuel - amount.
]

{ #category : 'private - testing' }
Ship >> fuel [
	"este metodo solo debe ser usado por los tests"

	^ fuel
]

{ #category : 'private - methods' }
Ship >> handleBlock: steps with: aMoveManager [

	(fuel < steps abs and: timeout == 0)
		ifTrue: [
	aMoveManager blockDueToFuel: self.]
]

{ #category : 'private - testing' }
Ship >> id [
	"este metodo solo debe ser usado por los tests"
	^ id
]

{ #category : 'methods' }
Ship >> increaseTimeoutBy: anumber [
	timeout := timeout + anumber


	"	timeout == anumber
		ifTrue: [
			amanager unblock: self.
			timeout := 0.
			self refillFuel ]
		ifFalse: [ timeout := timeout + 1 ]"
]

{ #category : 'initialize' }
Ship >> initializewith: anId andfuel: afuel andlapmanger: anlapmanager [
	fuel:=afuel.
	maxfuel:=afuel.
	id:=anId. 
	position:=0.
	lapmanger:=anlapmanager.
	timeout:=0.
	laps:=0.
	
]

{ #category : 'methods' }
Ship >> isAt: aPosition [
	^position =aPosition 
]

{ #category : 'private - methods' }
Ship >> isBlocked [
	^ timeout > 0.
]

{ #category : 'private - testing' }
Ship >> laps [
	"este metodo solo debe ser usado por los tests"
	^laps.
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
Ship >> moveBy: steps moveManager: aMoveManager [

	self handleBlock: steps with: aMoveManager.
	self isBlocked ifTrue: [ self reduceTimeout. ^ self ].
	self moveBy: steps.
	self consumeFuel: steps.
	lapmanger handle: self with: aMoveManager
]

{ #category : 'methods' }
Ship >> moveToFirstPosition [

	position:=0.
]

{ #category : 'private - testing' }
Ship >> position [
	"este metodo solo debe ser usado por los tests"

	^ position
]

{ #category : 'private - methods' }
Ship >> reduceTimeout [

	timeout := timeout - 1 max: 0.
]

{ #category : 'methods' }
Ship >> refillFuel [
    fuel := maxfuel .
]

{ #category : 'private - testing' }
Ship >> timeout [
	"este metodo solo debe ser usado por los tests"

	^ timeout
]
