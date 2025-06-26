Class {
	#name : 'Acceleration',
	#superclass : 'Object',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'creation' }
Acceleration class >> create [
	^ self new
]

{ #category : 'as yet unclassified' }
Acceleration >> applyEffect: aShip with: cardManager [

	cardManager addPermanentCard: self.
]

{ #category : 'as yet unclassified' }
Acceleration >> effectAppliedTo: aShip [
	^1
]
