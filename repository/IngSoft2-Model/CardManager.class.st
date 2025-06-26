"
clase CardManager: Maneja todas las cartas del juego
"
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

{ #category : 'method' }
CardManager >> addPermanentCard: card [

	activeCards add: card.
]

{ #category : 'method ally' }
CardManager >> allymetotheothership: aCard [ 
	
	aCard linkShip:target.
	lastcard:=(aCard copy).
]

{ #category : 'method' }
CardManager >> apply: aCard from: aShip to: aTarget [
	
	aShip removeCard: aCard.
	target := aTarget.
	aCard applyEffect: aShip with: self.
	self addPermanentCard:aCard.
]

{ #category : 'method Acceleration' }
CardManager >> applyAcceleration: aAccelerationCard [

	lastcard:=aAccelerationCard copy.
]

{ #category : 'method Redo' }
CardManager >> applyFromRedo: aCard from: aShip to: aTarget [
	
	target := aTarget.
	aCard applyEffect: aShip with: self.
	self addPermanentCard:aCard.
]

{ #category : 'method Overload' }
CardManager >> applyOverLoadWith: card [

	card newObjetiveShip: target .
	lastcard := card copy.
]

{ #category : 'method ally' }
CardManager >> handleally: aShip  fuel: fuel [

 activeCards  do: [:card | card ifAllyWith:aShip give: fuel] 
]

{ #category : 'initialization' }
CardManager >> initialize [

	activeCards := OrderedCollection new .
	lastcard:=Nonecard create.
]

{ #category : 'method Redo' }
CardManager >> playlastcard:aShip [
	self applyFromRedo: lastcard from:aShip to:target .
]

{ #category : 'method Cancelation' }
CardManager >> removePermanentCard [
	activeCards remove:target ifAbsent:[Error signal: 'no card found'].
]

{ #category : 'method' }
CardManager >> throwEffectsFor: aShip [
	| effects |
	activeCards isEmpty ifTrue: [ ^ 0 ].
	effects := activeCards collect: [ :card | card effectAppliedTo: aShip ].
	^ effects sum 
	
]
