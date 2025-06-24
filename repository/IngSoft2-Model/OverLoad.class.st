Class {
	#name : 'OverLoad',
	#superclass : 'Object',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
OverLoad >> applyEffect: aShip with: cardManager [

	cardManager overLoadAt: aShip
]

{ #category : 'as yet unclassified' }
OverLoad >> effectAppliedTo: aShip [
	^0
]
