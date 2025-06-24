Class {
	#name : 'Acceleration',
	#superclass : 'Object',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Acceleration >> applyeffect: aShip with: cardManager [

	cardManager addPermanentCard: self.
]

{ #category : 'as yet unclassified' }
Acceleration >> effectAppliedTo: aShip [
	^1
]
