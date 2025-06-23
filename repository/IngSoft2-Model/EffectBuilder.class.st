Class {
	#name : 'EffectBuilder',
	#superclass : 'Object',
	#instVars : [
		'collectionOfEffects',
		'dice',
		'positions'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
EffectBuilder class >> createWith: aDice and: aCollectionOfPositions [

	^ self new initializeWith: aDice and: aCollectionOfPositions
]

{ #category : 'building' }
EffectBuilder >> build [

	collectionOfEffects add:
		(self buildWormHoleOn: positions first and: positions second).
	
	 collectionOfEffects := collectionOfEffects, ((positions allButFirst: 2) collect: [ :pos |
		self randomEffectAt: pos ]).
	
	^ collectionOfEffects asOrderedCollection.
]

{ #category : 'building' }
EffectBuilder >> buildAtomicBombAt: pos with: prob [

	prob > 98 ifTrue: [ ^ AtomicBomb at: pos ].
	^nil.
]

{ #category : 'building' }
EffectBuilder >> buildBlackHoleAt: pos with: prob [

	prob > 40 ifTrue: [ ^ BlackHole at: pos ].
	^nil.
]

{ #category : 'building' }
EffectBuilder >> buildHyperGravityAt: pos with: prob [

	prob > 60 ifTrue: [ ^ HyperGravity at: pos with: dice roll ].
	^nil.
]

{ #category : 'building' }
EffectBuilder >> buildHyperJumpAt: pos with: prob [

	| listOfJumps |
	listOfJumps := OrderedCollection new.
	listOfJumps add: dice roll.
	listOfJumps add: dice roll.
	listOfJumps add: dice roll.
	prob > 90 ifTrue: [ ^ HyperJump at: pos with: listOfJumps ].
	^nil.
]

{ #category : 'building' }
EffectBuilder >> buildMoonWalkAt: pos with: prob [

	prob > 80 ifTrue: [ ^ MoonWalk at: pos and: dice roll ].
	^nil.
]

{ #category : 'building' }
EffectBuilder >> buildNoEffectAt: pos with: prob [

	prob > 0 ifTrue: [ ^ NoEffect at: pos ].
	^nil.
]

{ #category : 'building' }
EffectBuilder >> buildWormHoleOn: positionY and: positionZ [

	^ WormHole at: positionY and: positionZ
]

{ #category : 'initialization' }
EffectBuilder >> initializeWith: aDice and: aCollectionOfPositions [

	collectionOfEffects := OrderedCollection new.
	dice := aDice.
	positions := aCollectionOfPositions.
]

{ #category : 'accessing' }
EffectBuilder >> randomEffectAt: position [

	| effectBuilders probability |
	probability := dice roll.
	effectBuilders := {
		                  (self
			                   buildAtomicBombAt: position
			                   with: probability).
		                  (self 
									 buildHyperJumpAt: position
									 with: probability).
		                  (self 
									 buildMoonWalkAt: position 
									with: probability).
		                  (self
			                   buildHyperGravityAt: position
			                   with: probability).
		                  (self 
									 buildBlackHoleAt: position 
									 with: probability).
		                  (self 
									 buildNoEffectAt: position 
									 with: probability) }.
	^ effectBuilders detect: [ :block | block value notNil ]
]
