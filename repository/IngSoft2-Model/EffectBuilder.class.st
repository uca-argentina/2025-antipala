"
clase EffectBuilder: Recibe un dado de 100 caras, un array de posiciones para llenar con efectos en base a la probabilidad que reciba del dado de 100 caras y un array de dados a usar en el juego real para los efectos que necesitan usarlos.
"
Class {
	#name : 'EffectBuilder',
	#superclass : 'Object',
	#instVars : [
		'collectionOfEffects',
		'positions',
		'realDices',
		'diceOf100Faces'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'creation' }
EffectBuilder class >> createWith: aDiceOf100Faces and: aCollectionOfPositions and: dicesToUse [

	^ self new
		  initializeWith: aDiceOf100Faces
		  and: aCollectionOfPositions
		  and: dicesToUse
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

	prob > 60 ifTrue: [ ^ HyperGravity at: pos with: self throwRealDices ].
	^ nil
]

{ #category : 'building' }
EffectBuilder >> buildHyperJumpAt: pos with: prob [

	| listOfJumps |
	listOfJumps := OrderedCollection new.
	listOfJumps add: self throwRealDices.
	listOfJumps add: self throwRealDices.
	listOfJumps add: self throwRealDices.
	prob > 90 ifTrue: [ ^ HyperJump at: pos with: listOfJumps ].
	^ nil
]

{ #category : 'building' }
EffectBuilder >> buildMoonWalkAt: pos with: prob [

	prob > 80 ifTrue: [ ^ MoonWalk at: pos and: self throwRealDices ].
	^ nil
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
EffectBuilder >> initializeWith: aDiceOf100Faces and: aCollectionOfPositions and: dicesToUse [

	collectionOfEffects := OrderedCollection new.
	diceOf100Faces := aDiceOf100Faces.
	realDices := dicesToUse.
	positions := aCollectionOfPositions
]

{ #category : 'method' }
EffectBuilder >> randomEffectAt: position [

	| effectBuilders probability |
	probability := diceOf100Faces roll.
	effectBuilders := {
		                  (self buildAtomicBombAt: position with: probability).
		                  (self buildHyperJumpAt: position with: probability).
		                  (self buildMoonWalkAt: position with: probability).
		                  (self buildHyperGravityAt: position with: probability).
		                  (self buildBlackHoleAt: position with: probability).
		                  (self buildNoEffectAt: position with: probability) }.
	^ effectBuilders detect: [ :block | block value notNil ]
]

{ #category : 'accessing' }
EffectBuilder >> throwRealDices [

	| totalThrow |
	totalThrow := realDices 
		              inject: 0
		              into: [ :sum :eachDice | sum + eachDice roll ].
	^ totalThrow
]
