"
Clase MoveManager: Se encarga de mover correctamente las naves, teniendo en cuenta bloqueos dados por efectos
"
Class {
	#name : 'MoveManager',
	#superclass : 'Object',
	#instVars : [
		'listofblockship'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'operations' }
MoveManager class >> create [
	^self new intialize.
]

{ #category : 'method' }
MoveManager >> block: aShip by: timeout [

	aShip increaseTimeoutBy: timeout.
]

{ #category : 'method' }
MoveManager >> blockDueToFuel: aShip [

	aShip increaseTimeoutBy: 2.
	aShip moveToFirstPosition.
	aShip refillFuel
]

{ #category : 'initialize' }
MoveManager >> intialize [
	listofblockship := OrderedCollection new
]

{ #category : 'method' }
MoveManager >> move: aShip by: steps [

	aShip moveBy: steps moveManager: self

	"| isitblock |
	isitblock := listofblockship anySatisfy: [ :each | each == aShip ].
	isitblock
		ifTrue: [ aShip shiptimeout: 1 movemanger: self ]
		ifFalse: [ aShip moveBy: steps moveManager: self ]"

	"Tambien puede ser esta variante:
	listofblockship detect:[ :each | each == aShip ] ifNone: [aShip moveBy:steps  moveManager:self. ^nil].
	aShip shiptimeout:1  movemanger:self"
]

{ #category : 'method' }
MoveManager >> resetPosition: aShip [
	aShip moveToFirstPosition
]
