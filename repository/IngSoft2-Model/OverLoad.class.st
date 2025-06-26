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

{ #category : 'as yet unclassified' }
OverLoad >> applyEffect: aShip with: cardManager [
	cardManager applyOverLoadWith: self.
]

{ #category : 'as yet unclassified' }
OverLoad >> effectAppliedTo: aShip [

	^ (objetiveShip = aShip) ifTrue: [ -2 ] ifFalse: [ 0 ].
]

{ #category : 'as yet unclassified' }
OverLoad >> intialize [

	objetiveShip := nil.
]

{ #category : 'as yet unclassified' }
OverLoad >> newObjetiveShip: aShip [

	^ objetiveShip := aShip.
]
