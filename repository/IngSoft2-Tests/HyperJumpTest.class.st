Class {
	#name : 'HyperJumpTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
HyperJumpTest >> testAShipAdvancesWhenTriggersTheEffect [

	| effectlist game dices |

	effectlist := OrderedCollection new.
	effectlist add: (HyperJump at: 5 with: #( 2 )).

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
HyperJumpTest >> testHyperJumpCanReciveSeveralJumpValues [

	| effectlist game dices  |

	effectlist := OrderedCollection new.
	effectlist add: (HyperJump at: 5 with: #( 5 3 2) asSortedCollection).

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
	self assert: ((game ship: 1) isAt: 10).
	self assert: ((game ship: 2) isAt: 8).
	self assert: ((game ship: 3) isAt: 7)
]

{ #category : 'tests' }
HyperJumpTest >> testHyperJumpShouldBeCiclical [

	| effectlist game dices |
	effectlist := OrderedCollection new.
	effectlist add:( HyperJump at: 5 with: #( 3 1 ) asSortedCollection).

	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 5 -3 -1 30)).
	game := Game
		        createWith: 10
		        and: dices
		        and: effectlist
		        and: 3.
	game addShip.
	game play.
	self assert: ((game ship:1) isAt: 8).

	game play.
	self assert: ((game ship:1) isAt: 6).

	game play.
	self assert: ((game ship:1)isAt: 8)
]

{ #category : 'tests' }
HyperJumpTest >> testHyperJumpShouldManageFuelCases [

	| alapmanager effectlist game dices anHyperJump |
	alapmanager := Lapmanager createWith: 20.

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

	| alapmanager effectlist game dices anHyperJump |
	alapmanager := Lapmanager createWith: 20.

	effectlist := OrderedCollection new.
	anHyperJump := HyperJump at: 5 with: #( 3 1 2 ) asSortedCollection.
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
	self assert: ((game ship: 1) isAt: 8).
	self assert: ((game ship: 2) isAt: 7).
	self assert: ((game ship: 3) isAt: 6)
]
