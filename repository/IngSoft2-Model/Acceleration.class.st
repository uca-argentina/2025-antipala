Class {
	#name : 'Acceleration',
	#superclass : 'Cards',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'creation' }
Acceleration class >> create [
	^ self new
]

{ #category : 'as yet unclassified' }
Acceleration >> applyEffect: aShip with: cardManager [

	^self
]

{ #category : 'as yet unclassified' }
Acceleration >> effectAppliedTo: aShip [
	^1
]
