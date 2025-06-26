Class {
	#name : 'CardManager',
	#superclass : 'Object',
	#instVars : [
		'activeCards',
		'targetShip'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'creation' }
CardManager class >> create [
^ self new initialize
]

{ #category : 'as yet unclassified' }
CardManager >> addPermanentCard: card [

	activeCards add: card.
]

{ #category : 'as yet unclassified' }
CardManager >> allymetotheothership: aCard [ 
	
	aCard linkShip:targetShip.
	self addPermanentCard:aCard.
]

{ #category : 'as yet unclassified' }
CardManager >> apply: aCard from: aShip to: aTargetShip [

	targetShip := aTargetShip.
	aCard applyEffect: aShip with: self.
	
]

{ #category : 'as yet unclassified' }
CardManager >> effectsFor: aShip [

	^0
]

{ #category : 'as yet unclassified' }
CardManager >> handleally: aShip  step: steps [



 activeCards  do: [:card | card ifAlly:aShip steps:steps] 
]

{ #category : 'as yet unclassified' }
CardManager >> initialize [

	activeCards := OrderedCollection new .
]

{ #category : 'as yet unclassified' }
CardManager >> initializlalaeWith: someCards [

	activeCards := OrderedCollection new .
]

{ #category : 'as yet unclassified' }
CardManager >> lastActiveEffect [

	^activeCards last.
]

{ #category : 'as yet unclassified' }
CardManager >> throwEffectsFor: aShip [
	| effects |
	activeCards isEmpty ifTrue: [ ^ 0 ].
	effects := activeCards collect: [ :card | card effectAppliedTo: aShip ].
	^ effects sum 
	
]
