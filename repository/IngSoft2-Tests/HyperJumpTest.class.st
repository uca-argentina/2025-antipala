Class {
	#name : 'HyperJumpTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'asserting' }
HyperJumpTest >> should: anErrorBlock raise: anErrorClass withMessageText: errorMessage [
	self
		should: anErrorBlock
		raise: anErrorClass
		withExceptionDo: [ :error |
			self assert: (error messageText) equals: errorMessage ].
]

{ #category : 'tests' }
HyperJumpTest >> testAShipAdvancesWhenTriggersTheEffect [

	| effectlist game dices |
	effectlist := OrderedCollection new.
	effectlist add: (HyperJump at: 5 with: #( 5 )).

	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 5 )).

	game := Game
		        createWith: 20
		        and: dices
		        and: effectlist
		        and: 3.
	game addShip.
	game addShip.
	game addShip.
	self assert: ((game ship: 1) isAt: 0).

	game play.
	self assert: ((game ship: 1) isAt: 7)
]

{ #category : 'tests' }
HyperJumpTest >> testHyperJumpCanHandleDecimalJumps [

	| effectlist game dices anHyperJump |
	effectlist := OrderedCollection new.
	anHyperJump := HyperJump at: 5 with: #( 3 ) asSortedCollection.
	effectlist add: anHyperJump.

	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 5 -1)).

	game := Game
		        createWith: 10
		        and: dices
		        and: effectlist
		        and: 3.
	game addShip.
	game play.
	self assert: ((game ship: 1) isAt: 6). "Ship RealPosition => 6.5"
	game play. "5.5"
	self assert: ((game ship: 1) isAt: 7). "Ship RealPosition => 7.0"
]

{ #category : 'tests' }
HyperJumpTest >> testHyperJumpCanReciveSeveralJumpValues [

	| effectlist game dices |
	effectlist := OrderedCollection new.
	effectlist add: (HyperJump at: 5 with: #( 12 8 4 ) asSortedCollection).

	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 5 )).

	game := Game
		        createWith: 20
		        and: dices
		        and: effectlist
		        and: 3.
	game addShip.
	game addShip.
	game addShip.
	game play.
	game play.
	game play.
	self assert: ((game ship: 1) isAt: 0).
	self assert: ((game ship: 2) isAt: 9).
	self assert: ((game ship: 3) isAt: 7)
]

{ #category : 'tests' }
HyperJumpTest >> testHyperJumpShouldBeCiclical [

	| effectlist game dices |
	effectlist := OrderedCollection new.
	effectlist add: (HyperJump at: 5 with: #( 12 4 ) asSortedCollection).

	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 5 -6 -2 30 )).
	game := Game
		        createWith: 15
		        and: dices
		        and: effectlist
		        and: 3.
	game addShip.
	game play.
	self assert: ((game ship: 1) isAt: 11).

	game play.
	self assert: ((game ship: 1) isAt: 7).

	game play.
	self assert: ((game ship: 1) isAt: 11)
]

{ #category : 'tests' }
HyperJumpTest >> testHyperJumpShouldManageFuelCases [

	| alapmanager effectlist game dices anHyperJump |
	alapmanager := LapManager createWith: 20.

	effectlist := OrderedCollection new.
	anHyperJump := HyperJump at: 5 with: #( 10 ) asSortedCollection.
	effectlist add: anHyperJump.

	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 5 )).

	game := Game
		        createWith: 10
		        and: dices
		        and: effectlist
		        and: 3.
	game addShip.
	game play.
	self assert: ((game ship: 1) isAt: 0)
]

{ #category : 'tests' }
HyperJumpTest >> testHyperJumpShouldSortTheJumpValues [

	| effectlist game dices anHyperJump |
	effectlist := OrderedCollection new.
	anHyperJump := HyperJump at: 5 with: #( 12 4 8 ) asSortedCollection.
	effectlist add: anHyperJump.

	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 5 )).

	game := Game
		        createWith: 10
		        and: dices
		        and: effectlist
		        and: 3.
	game addShip.
	game addShip.
	game addShip.
	game play.
	game play.
	game play.
	self assert: ((game ship: 1) isAt: 0).
	self assert: ((game ship: 2) isAt: 9).
	self assert: ((game ship: 3) isAt: 7)
]

{ #category : 'tests' }
HyperJumpTest >> testTheHyperJumpPositionCannotBeNegative [
	self
		should: [ HyperJump new initializeWith: -4 withJumps: #(1 2 3) asOrderedCollection ]
		raise: Error
		withMessageText: 'The HyperJump position must be positive'
]
