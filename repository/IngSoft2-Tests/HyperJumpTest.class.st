Class {
	#name : 'HyperJumpTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
HyperJumpTest >> testAShipAdvancesWhenTriggersTheEffect [

	| game dices tiles |
	tiles := OrderedCollection new.
	20 timesRepeat: [ tiles add: (NoEffect create)].
	tiles at: 6 put: (HyperJump createWith: #( 3 ) asSortedCollection).
	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 5 )).

	game := Game createOn: tiles toPlayWith: dices withARequired: 3 andWithThePlayers: 1.
	self assert: ((game ship: 1) isAt: 1).

	game play.
	self assert: ((game ship: 1) isAt: 7)
]

{ #category : 'tests' }
HyperJumpTest >> testHyperJumpCanHandleDecimalJumps [

	| game dices tiles |
	tiles := OrderedCollection new.
	10 timesRepeat: [ tiles add: (NoEffect create)].
	tiles at: 5 put: (HyperJump createWith: #( 3 ) asSortedCollection).
	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 4 0 -1)).

	game := Game createOn: tiles toPlayWith: dices withARequired: 3 andWithThePlayers: 1.
	game play.
	self assert: ((game ship: 1) isAt: 6). "Ship RealPosition => 6.5"
	game play. "5.5"
	self assert: ((game ship: 1) isAt: 7) "Ship RealPosition => 7.0"
	
]

{ #category : 'tests' }
HyperJumpTest >> testHyperJumpCanReciveSeveralJumpValues [

	| game dices tiles |
	tiles := OrderedCollection new.
	20 timesRepeat: [ tiles add: (NoEffect create)].
	tiles at: 6 put: (HyperJump createWith: #( 12 8 4 ) asSortedCollection).
	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 5 )).

	game := Game createOn: tiles toPlayWith: dices withARequired: 3 andWithThePlayers: 3.
	game play.
	game play.
	game play.
	self assert: ((game ship: 1) isAt: 1).
	self assert: ((game ship: 2) isAt: 10).
	self assert: ((game ship: 3) isAt: 8)
]

{ #category : 'tests' }
HyperJumpTest >> testHyperJumpShouldBeCiclical [

	
	| game dices tiles |
	tiles := OrderedCollection new.
	20 timesRepeat: [ tiles add: (NoEffect create)].
	tiles at: 6 put: (HyperJump createWith: #( 12 4 ) asSortedCollection).
	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 5 -6 -2 30)).

	game := Game createOn: tiles toPlayWith: dices withARequired: 3 andWithThePlayers: 1.
	game play.
	self assert: ((game ship: 1) isAt: 12).

	game play.
	self assert: ((game ship: 1) isAt: 8).

	game play.
	self assert: ((game ship: 1) isAt: 12)
]

{ #category : 'tests' }
HyperJumpTest >> testHyperJumpShouldManageFuelCases [

	| game dices tiles |
	tiles := OrderedCollection new.
	11 timesRepeat: [ tiles add: (NoEffect create)].
	tiles at: 6 put: (HyperJump createWith: #( 10 ) asSortedCollection).
	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 5 )).

	game := Game createOn: tiles toPlayWith: dices withARequired: 3 andWithThePlayers: 1.
	game play.
	self assert: ((game ship: 1) isAt: 1)
]

{ #category : 'tests' }
HyperJumpTest >> testHyperJumpShouldSortTheJumpValues [

	| game dices tiles |
	tiles := OrderedCollection new.
	15 timesRepeat: [ tiles add: (NoEffect create)].
	tiles at: 6 put: (HyperJump createWith: #( 12 4 8 ) asSortedCollection).
	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 5 )).

	game := Game createOn: tiles toPlayWith: dices withARequired: 3 andWithThePlayers: 3.
	game play.
	game play.
	game play.
	self assert: ((game ship: 1) isAt: 1).
	self assert: ((game ship: 2) isAt: 10).
	self assert: ((game ship: 3) isAt: 8)
]
