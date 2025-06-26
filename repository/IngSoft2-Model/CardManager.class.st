Class {
	#name : 'CardManager',
	#superclass : 'Object',
	#instVars : [
		'activeCards',
		'targetShip',
		'lastcard'
	],
	#classInstVars : [
		'lastcard'
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
	lastcard:=(aCard copy).
]

{ #category : 'as yet unclassified' }
CardManager >> apply: aCard from: aShip to: aTargetShip [
   
	targetShip := aTargetShip.
	aCard applyEffect: aShip with: self.
	self addPermanentCard:aCard.
	
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
	lastcard:=0
]

{ #category : 'as yet unclassified' }
CardManager >> lastActiveEffect [

	^activeCards last.
]

{ #category : 'as yet unclassified' }
CardManager >> playlastcard:aShip [
	self apply:lastcard from:aShip to:targetShip .
]

{ #category : 'removing' }
CardManager >> removePermanentCard [
	activeCards remove:targetShip ifAbsent:[Error signal: 'no card found'].
]

{ #category : 'as yet unclassified' }
CardManager >> throwEffectsFor: aShip [
	| effects |
	activeCards isEmpty ifTrue: [ ^ 0 ].
	effects := activeCards collect: [ :card | card effectAppliedTo: aShip ].
	^ effects sum 
	
]
