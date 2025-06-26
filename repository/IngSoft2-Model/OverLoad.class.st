"
clase Overload: Reduce el movimiento de una nave a eleccion.
"
Class {
	#name : 'OverLoad',
	#superclass : 'Cards',
	#instVars : [
		'objetiveShip'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'creation' }
OverLoad class >> create [

	^ self new
]

{ #category : 'method' }
OverLoad >> applyEffect: aShip with: cardManager [
	cardManager applyOverLoadWith: self.
]

{ #category : 'method' }
OverLoad >> effectAppliedTo: aShip [

	^ (objetiveShip = aShip) ifTrue: [ -2 ] ifFalse: [ 0 ].
]

{ #category : 'initialize' }
OverLoad >> intialize [

	objetiveShip := nil.
]

{ #category : 'method' }
OverLoad >> newObjetiveShip: aShip [

	^ objetiveShip := aShip.
]
