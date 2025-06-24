Class {
	#name : 'CardManager',
	#superclass : 'Object',
	#instVars : [
		'activeCards'
	],
	#classInstVars : [
		'activeCards'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'initialization' }
CardManager class >> initializeManager [
	^self new.
]

{ #category : 'adding' }
CardManager >> addActiveCard: aCard [ 
	activeCards add: aCard.
]

{ #category : 'as yet unclassified' }
CardManager >> apply: Acard from: aShip to: aTargetShip [
	
	Acard applyeffect:aShip to:aTargetShip.
	
]

{ #category : 'as yet unclassified' }
CardManager >> apply: aCancellationCard from: aShip toDelete: aTargetCard [
	aCancellationCard applyeffectTo: self toDelete: aTargetCard.
]

{ #category : 'public' }
CardManager >> delete: anActiveTargetCard [ 
	activeCards := activeCards reject: [ :each | each = anActiveTargetCard ].
]

{ #category : 'as yet unclassified' }
CardManager >> findActiveCard: aTargetCard [ 
	activeCards detect: [ :card | card = aTargetCard ] ifNone: [ ^false ].
]

{ #category : 'initialization' }
CardManager >> initialize [ 
	super initialize.
	activeCards := OrderedCollection new.
]

{ #category : 'as yet unclassified' }
CardManager >> throwEffectsFor: aShip [
	| efectos |
	efectos:= activeCards collect: [ :card | card effectAppliedTo: aShip ].
	^ efectos sum 
	
]
