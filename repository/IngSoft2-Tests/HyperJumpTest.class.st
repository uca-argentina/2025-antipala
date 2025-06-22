Class {
	#name : 'HyperJumpTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
HyperJumpTest >> testAShipAdvancesWhenTriggersTheEffect [

	| alapmanager effectlist game dices anHyperJump |
	alapmanager := Lapmanager createWith: 20.

	effectlist := OrderedCollection new.
	anHyperJump := HyperJump at: 5 with: #( 2 ).
	effectlist add: anHyperJump.

	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #(5)).

	game := Game
		        createShipPlayer: 1
		        lengthOfBoard: 20
		        dices: dices
		        and: effectlist.

	self assert: ((game ship: 1) isAt: 0).

	game play.
	self assert: ((game ship: 1) isAt: 7)
]

{ #category : 'tests' }
HyperJumpTest >> testHyperJumpCanReciveSeveralJumpValues [

	| alapmanager effectlist game dices anHyperJump |
	alapmanager := Lapmanager createWith: 20.

	effectlist := OrderedCollection new.
	anHyperJump := HyperJump at: 5 with: #( 5 3 2 ) asSortedCollection.
	effectlist add: anHyperJump.

	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #(5)).

	game := Game
		        createShipPlayer: 3
		        lengthOfBoard: 20
		        dices: dices
		        and: effectlist.

	game play.
	game play.
	game play.
	self assert: ((game ship: 1) isAt: 10).
	self assert: ((game ship: 2) isAt: 8).
	self assert: ((game ship: 3) isAt: 7)
]

{ #category : 'tests' }
HyperJumpTest >> testHyperJumpShouldBeCiclical [

	| effectlist game dices anHyperJump effectManager aMoveManager ship |
	effectlist := OrderedCollection new.
	anHyperJump := HyperJump at: 5 with: #( 3 1 ) asSortedCollection.
	effectlist add: anHyperJump.

	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #(5)).

	ship := Ship
		        createWhithId: 1
		        andWithFuel: 50
		        andwithlapmanager: (Lapmanager createWith: 10).
	aMoveManager := MoveManager create.
	effectManager := Effectsmanager
		                 createWith: effectlist
		                 and: aMoveManager.

	game := Game
		        createShipPlayer: 1
		        lengthOfBoard: 10
		        dices: dices
		        and: effectlist. "no es necesario que haga nada, pero se pide para otros efectos"

	aMoveManager move: ship by: 5.
	effectManager applyAnEffectTo: ship in: game with: 5.
	self assert: (ship isAt: 8).

	aMoveManager move: ship by: -3.
	effectManager applyAnEffectTo: ship in: game with: 5.
	self assert: (ship isAt: 6).

	aMoveManager move: ship by: -1.
	effectManager applyAnEffectTo: ship in: game with: 5.
	self assert: (ship isAt: 8)
]

{ #category : 'tests' }
HyperJumpTest >> testHyperJumpShouldManageFuelCases [

	| alapmanager effectlist game dices anHyperJump |
	alapmanager := Lapmanager createWith: 20.

	effectlist := OrderedCollection new.
	anHyperJump := HyperJump at: 5 with: #( 10 ) asSortedCollection.
	effectlist add: anHyperJump.

	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #(5)).

	game := Game
		        createShipPlayer: 3
		        lengthOfBoard: 20
		        dices: dices
		        and: effectlist.

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
	dices add: (ChargeDice createWith: #(5)).

	game := Game
		        createShipPlayer: 3
		        lengthOfBoard: 20
		        dices: dices
		        and: effectlist.

	game play.
	game play.
	game play.
	self assert: ((game ship: 1) isAt: 8).
	self assert: ((game ship: 2) isAt: 7).
	self assert: ((game ship: 3) isAt: 6)
]
