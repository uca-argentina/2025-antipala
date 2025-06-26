Class {
	#name : 'Ally',
	#superclass : 'Object',
	#instVars : [
		'linkShip'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Ally >> applyEffect: aShip with: cardManager [


   self linkShip:aShip.
	cardManager allymetotheothership:self.
	

]

{ #category : 'as yet unclassified' }
Ally >> effectAppliedTo: aShip [
	^0
]

{ #category : 'as yet unclassified' }
Ally >> intializeWith [
linkShip:=OrderedCollection new.
]

{ #category : 'as yet unclassified' }
Ally >> linkShip: aShip [
	linkShip add:aShip.
]
