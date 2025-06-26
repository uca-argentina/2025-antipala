Class {
	#name : 'Redo',
	#superclass : 'Cards',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'creation' }
Redo class >> create [
	self shouldBeImplemented.
]

{ #category : 'as yet unclassified' }
Redo >> applyEffect: aShip with: aCardManager [ 
	aCardManager playlastcard:aShip .
]

{ #category : 'as yet unclassified' }
Redo >> effectAppliedTo: aShip [
	^0
]

{ #category : 'as yet unclassified' }
Redo >> ifAlly:aShip steps:steps [
]
