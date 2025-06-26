Class {
	#name : 'Ally',
	#superclass : 'Object',
	#instVars : [
		'linkedships'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Ally >> applyEffect: aShip with: cardManager [
   self linkShip:aShip.
	cardManager  linkmyshipwithallycard:self.
	

]

{ #category : 'as yet unclassified' }
Ally >> effectAppliedTo: aShip [
	^0
]

{ #category : 'as yet unclassified' }
Ally >> intializeWith [


linkedships:=OrderedCollection new
]

{ #category : 'as yet unclassified' }
Ally >> linkShip:aShip [
linkedships add:aShip
]
