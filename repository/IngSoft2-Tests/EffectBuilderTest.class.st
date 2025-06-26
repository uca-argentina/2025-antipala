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
	chargeDiceOf100Faces := ChargeDice createWith: #( 99 ).
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
	chargeDiceOf100Faces := ChargeDice createWith: #( 45 ).
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
	chargeDiceOf100Faces := ChargeDice createWith: #( 65 ).
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
EffectBuilderTest >> testEffectBuilderShoudStartBuildingAWormHole [

	| builder effects chargeDice ship moveManager aCollectionOfPositions effectAtPosition alapmanager aCollectionOfDices |
	aCollectionOfPositions := { 5. 9. 7 } asOrderedCollection.
	chargeDice := ChargeDice createWith: #( 1 2 3 4 5 6 7 8 9 10 ).
	aCollectionOfDices := OrderedCollection new.
	aCollectionOfDices add: (ChargeDice createWith: #( 3 4 5 )).
	builder := EffectBuilder
		           createWith: chargeDice
		           and: aCollectionOfPositions
		           and: aCollectionOfDices.
	effects := builder build.
	alapmanager := LapManager createWith: 100.
	ship := Ship createWhithId: 1 andWithFuel: 1000.
	moveManager := MoveManager createWith: alapmanager and: (CardManager createWith: #(  ))..
	moveManager move: ship by: 5.
	effectAtPosition := effects detect: [ :e | e shouldApplyTo: ship ].
	self assert: effectAtPosition class equals: WormHoleExit.


	moveManager move: ship by: 2.
	effectAtPosition := effects detect: [ :e | e shouldApplyTo: ship ].
	self assert: effectAtPosition class equals: NoEffect.


	moveManager move: ship by: 2.
	effectAtPosition := effects detect: [ :e | e shouldApplyTo: ship ].
	self assert: effectAtPosition class equals: WormHoleExit
]

{ #category : 'tests' }
EffectBuilderTest >> testWhenBothPositionsAreNegativeThrowAnError [

self
	should:[WormHoleExit at:-20 and: -20]
	raise: Error
	withMessageText: 'The WormHole Position can not be negative'.
]
