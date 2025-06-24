Class {
	#name : 'Ally',
	#superclass : 'Object',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Ally >> applyEffect: aShip with: cardManager [

	cardManager applyAllyWith: aShip .
	

]

{ #category : 'as yet unclassified' }
Ally >> effectAppliedTo: aShip [
	^0
]
