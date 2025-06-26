Class {
	#name : 'EffectBuilderTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'asserting' }
EffectBuilderTest >> should: anErrorBlock raise: anErrorClass withMessageText: errorMessage [

self
	should: anErrorBlock
	raise: anErrorClass
	withExceptionDo: [ :error | self assert: (error messageText)
			equals: errorMessage ]. 
	
	
]

{ #category : 'tests' }
EffectBuilderTest >> testEffectBuilderCanBuildAnAtomicBomb [

	| builder tiles chargeDiceOf100Faces effectAtPosition dices game aCollectionOfPositions |
	aCollectionOfPositions := { 3. 6. 5 } asOrderedCollection.
	chargeDiceOf100Faces := ChargeDice createWith: #( 99  100).
	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 4 )).
	builder := EffectBuilder
		           createWith: chargeDiceOf100Faces
		           and: aCollectionOfPositions
		           and: dices.
	tiles := builder build.
	effectAtPosition := tiles at: 5.
	game := Game createOn: tiles toPlayWith: dices withARequired: 3 andWithThePlayers: 1.
	game play.
	self assert: ((game ship: 1) isAt:1).
	self assert: effectAtPosition class equals: AtomicBomb
]

{ #category : 'tests' }
EffectBuilderTest >> testEffectBuilderCanBuildAnBlackHole [

	| builder tiles chargeDiceOf100Faces effectAtPosition dices game aCollectionOfPositions |
	aCollectionOfPositions := { 3. 6. 5 } asOrderedCollection.
	chargeDiceOf100Faces := ChargeDice createWith: #( 45  100).
	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 5 )).
	builder := EffectBuilder
		           createWith: chargeDiceOf100Faces
		           and: aCollectionOfPositions
		           and: dices.
	tiles := builder build.
	effectAtPosition := tiles at: 6.
	game := Game createOn: tiles toPlayWith: dices withARequired: 3 andWithThePlayers: 1.
	game play.
	self assert: ((game ship: 1) isAt:3).
	self assert: effectAtPosition class equals: WormHole 
]

{ #category : 'tests' }
EffectBuilderTest >> testEffectBuilderCanBuildAnHyperGravity [
	| builder tiles chargeDiceOf100Faces effectAtPosition dices game aCollectionOfPositions |
	aCollectionOfPositions := { 3. 19. 4 } asOrderedCollection.
	chargeDiceOf100Faces := ChargeDice createWith: #( 65 100).
	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 5 )).
	builder := EffectBuilder
		           createWith: chargeDiceOf100Faces
		           and: aCollectionOfPositions
		           and: dices.
	tiles := builder build.
	effectAtPosition := tiles at: 4.
	dices at: 1 put: (ChargeDice createWith: #( 3 3 5 )).
	game := Game createOn: tiles toPlayWith: dices withARequired: 3 andWithThePlayers: 1.
	game play.
	self assert: effectAtPosition class equals: HyperGravity.
	self assert: ((game ship: 1) isAt: 4).
	game play.
	self assert: ((game ship: 1) isAt: 4).
	game play.
	self assert: ((game ship: 1) isAt: 9).
]

{ #category : 'tests' }
EffectBuilderTest >> testEffectBuilderCantBeCreatedWithNegativeTiles [

	| aCollectionOfPositions chargeDiceOf100Faces dices |
	aCollectionOfPositions := { -1. 0. 9 } asOrderedCollection.
	chargeDiceOf100Faces := ChargeDice createWith: #( 3 4 5 100).
	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 1 )).
self
	should:[EffectBuilder
		           createWith: chargeDiceOf100Faces
		           and: aCollectionOfPositions
		           and: dices.]
	raise: Error
	withMessageText: 'The game cant have negative tiles'.
]

{ #category : 'tests' }
EffectBuilderTest >> testEffectBuilderCantBeCreatedWithTilesAt0 [

	| aCollectionOfPositions chargeDiceOf100Faces dices |
	aCollectionOfPositions := { 1. 0. 9 } asOrderedCollection.
	chargeDiceOf100Faces := ChargeDice createWith: #( 3 4 100 ).
	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 1 )).
self
	should:[EffectBuilder
		           createWith: chargeDiceOf100Faces
		           and: aCollectionOfPositions
		           and: dices.]
	raise: Error
	withMessageText: 'The game cant have tiles in the position 0'.
]

{ #category : 'tests' }
EffectBuilderTest >> testEffectBuilderCantBeCreatedWithoutA100FacesDice [

	| aCollectionOfPositions chargeDiceOf100Faces dices |
	aCollectionOfPositions := { 1. 2. 3 } asOrderedCollection.
	chargeDiceOf100Faces := ChargeDice createWith: #( 3 4 10 ).
	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 1 )).
self
	should:[EffectBuilder
		           createWith: chargeDiceOf100Faces
		           and: aCollectionOfPositions
		           and: dices.]
	raise: Error
	withMessageText: 'the Dice Of 100 Faces thould have 100 faces'.
]

{ #category : 'tests' }
EffectBuilderTest >> testEffectBuilderShoudStartBuildingAWormHole [

	| builder tiles chargeDiceOf100Faces dices game aCollectionOfPositions |
	aCollectionOfPositions := { 5. 9. 98 } asOrderedCollection.
	chargeDiceOf100Faces := ChargeDice createWith: #( 3 4 5 100).
	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 1 )).
	builder := EffectBuilder
		           createWith: chargeDiceOf100Faces
		           and: aCollectionOfPositions
		           and: dices.
	tiles := builder build.
	
	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 4 2 2)).
	game := Game createOn: tiles toPlayWith: dices withARequired: 3 andWithThePlayers: 1.
	game play.
	self assert: ((game ship: 1) isAt:9).
	self assert: (tiles at: 5) class equals: WormHole.
	self assert: (tiles at: 9) class equals: WormHole.
]
