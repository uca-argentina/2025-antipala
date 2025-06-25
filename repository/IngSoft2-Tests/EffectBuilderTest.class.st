Class {
	#name : 'EffectBuilderTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
EffectBuilderTest >> testEffectBuilderCanBuildAnAtomicBomb [

	| builder effects chargeDice aCollectionOfPositions effectAtPosition aCollectionOfDices game |
	aCollectionOfPositions := { 1. 2. 5 } asOrderedCollection.
	chargeDice := ChargeDice createWith: #( 99 ).
	aCollectionOfDices := OrderedCollection new.
	aCollectionOfDices add: (ChargeDice createWith: #( 5 )).
	builder := EffectBuilder
		           createWith: chargeDice
		           and: aCollectionOfPositions
		           and: aCollectionOfDices.
	effects := builder build.
	effectAtPosition := effects at: 2.
	game := Game
		        createWith: 20
		        and: aCollectionOfDices
		        and: effects
		        and: 3.
	game addShip.
	game play.
	self assert: ((game ship: 1) isAt:0).
	self assert: effectAtPosition class equals: AtomicBomb
]

{ #category : 'tests' }
EffectBuilderTest >> testEffectBuilderCanBuildAnBlackHole [

	| builder effects chargeDice aCollectionOfPositions effectAtPosition aCollectionOfDices game |
	aCollectionOfPositions := { 1. 2. 5 } asOrderedCollection.
	chargeDice := ChargeDice createWith: #( 45 ).
	aCollectionOfDices := OrderedCollection new.
	aCollectionOfDices add: (ChargeDice createWith: #( 5 )).
	builder := EffectBuilder
		           createWith: chargeDice
		           and: aCollectionOfPositions
		           and: aCollectionOfDices.
	effects := builder build.
	effectAtPosition := effects at: 2.
	game := Game
		        createWith: 20
		        and: aCollectionOfDices
		        and: effects
		        and: 3.
	game addShip.
	game play.
	self assert: ((game ship: 1) isAt:1).
	self assert: effectAtPosition class equals: BlackHole 
]

{ #category : 'tests' }
EffectBuilderTest >> testEffectBuilderCanBuildAnHyperGravity [

	| builder effects chargeDice aCollectionOfPositions effectAtPosition aCollectionOfDices game |
	aCollectionOfPositions := { 2. 3. 4 } asOrderedCollection.
	chargeDice := ChargeDice createWith: #( 65 ).
	aCollectionOfDices := OrderedCollection new.
	aCollectionOfDices add: (ChargeDice createWith: #( 5 )).
	builder := EffectBuilder
		           createWith: chargeDice
		           and: aCollectionOfPositions
		           and: aCollectionOfDices.
	effects := builder build.
	effectAtPosition := effects at: 2.
	aCollectionOfDices at: 1 put: (ChargeDice createWith: #( 4 3 5 )).
	game := Game
		        createWith: 20
		        and: aCollectionOfDices
		        and: effects
		        and: 3.
	game addShip.
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
	self assert: effectAtPosition class equals: WormHole.


	moveManager move: ship by: 2.
	effectAtPosition := effects detect: [ :e | e shouldApplyTo: ship ].
	self assert: effectAtPosition class equals: NoEffect.


	moveManager move: ship by: 2.
	effectAtPosition := effects detect: [ :e | e shouldApplyTo: ship ].
	self assert: effectAtPosition class equals: WormHole
]
