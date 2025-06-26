Class {
	#name : 'CardManager',
	#superclass : 'Object',
	#instVars : [
		'activeCards',
		'lastcard',
		'target'
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
	
	aCard linkShip:target.
	lastcard:=(aCard copy).
]

{ #category : 'as yet unclassified' }
CardManager >> apply: aCard from: aShip to: aTarget [
	
	aShip removeCard: aCard.
	target := aTarget.
	aCard applyEffect: aShip with: self.
	self addPermanentCard:aCard.
]

{ #category : 'as yet unclassified' }
CardManager >> applyFromRedo: aCard from: aShip to: aTarget [
	
	target := aTarget.
	aCard applyEffect: aShip with: self.
	self addPermanentCard:aCard.
]

{ #category : 'as yet unclassified' }
CardManager >> applyOverLoadWith: card [

	card newObjetiveShip: target .
]

{ #category : 'as yet unclassified' }
CardManager >> effectsFor: aShip [

	^0
]

{ #category : 'as yet unclassified' }
CardManager >> handleally: aShip  fuel: fuel [

 activeCards  do: [:card | card ifAllyWith:aShip give: fuel] 
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
	self applyFromRedo: lastcard from:aShip to:target .
]

{ #category : 'removing' }
CardManager >> removePermanentCard [
	activeCards remove:target ifAbsent:[Error signal: 'no card found'].
]

{ #category : 'as yet unclassified' }
CardManager >> throwEffectsFor: aShip [
	| effects |
	activeCards isEmpty ifTrue: [ ^ 0 ].
	effects := activeCards collect: [ :card | card effectAppliedTo: aShip ].
	^ effects sum 
	
]
