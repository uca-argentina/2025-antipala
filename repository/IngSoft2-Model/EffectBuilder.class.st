"
clase EffectBuilder: Recibe un dado de 100 caras, un array de posiciones para llenar con efectos en base a la probabilidad que reciba del dado de 100 caras y un array de dados a usar en el juego real para los efectos que necesitan usarlos.
"
Class {
	#name : 'EffectBuilder',
	#superclass : 'Object',
	#instVars : [
		'collectionOfEffects',
		'realDices',
		'diceOf100Faces',
		'tiles'
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
	| numberOfTiles diference otherTiles |
	numberOfTiles := tiles max +1.
	
	collectionOfEffects := (1 to: numberOfTiles ) collect: [:tile |NoEffect create].
	
	diference := tiles second - tiles first.
	
	collectionOfEffects at: (tiles first) put: (WormHole createWith: diference).
	collectionOfEffects at: (tiles second) put: (WormHole createWith: diference negated).
	
	otherTiles := tiles allButFirst: 2.
	otherTiles do: [:tile |
		collectionOfEffects at: (tile ) put: self randomEffect
	].
	^ collectionOfEffects asOrderedCollection.
]

{ #category : 'building' }
EffectBuilder >> buildAtomicBombAt: pos with: prob [

	prob > 98 ifTrue: [ ^ AtomicBomb create ].
	^nil.
]

{ #category : 'building' }
EffectBuilder >> buildBlackHoleAt: pos with: prob [

	prob > 40 ifTrue: [ ^ BlackHole create ].
	^nil.
]

{ #category : 'building' }
EffectBuilder >> buildHyperGravityAt: pos with: prob [

	prob > 60 ifTrue: [ ^ HyperGravity createWith: self throwRealDices ].
	^ nil
]

{ #category : 'building' }
EffectBuilder >> buildHyperJumpAt: pos with: prob [

	| listOfJumps |
	listOfJumps := OrderedCollection new.
	listOfJumps add: self throwRealDices.
	listOfJumps add: self throwRealDices.
	listOfJumps add: self throwRealDices.
	prob > 90 ifTrue: [ ^ HyperJump createWith: listOfJumps ].
	^ nil
]

{ #category : 'building' }
EffectBuilder >> buildMoonWalkAt: pos with: prob [

	prob > 80 ifTrue: [ ^ MoonWalk  createWith: self throwRealDices ].
	^ nil
]

{ #category : 'building' }
EffectBuilder >> buildNoEffectAt: pos with: prob [

	prob > 0 ifTrue: [ ^ NoEffect create ].
	^nil.
]

{ #category : 'initialization' }
EffectBuilder >> initializeWith: aDiceOf100Faces and: aCollectionOfPositions and: dicesToUse [

	collectionOfEffects := OrderedCollection new.
	diceOf100Faces := aDiceOf100Faces.
	realDices := dicesToUse.
	tiles := aCollectionOfPositions.
]

{ #category : 'method' }
EffectBuilder >> randomEffect [

	| effectBuilders probability position |
	position := 0.
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
