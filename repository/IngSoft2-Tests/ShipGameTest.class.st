Class {
	#name : 'ShipGameTest',
	#superclass : 'TestCase',
	#instVars : [
		'game'
	],
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
ShipGameTest >> testRanking [

	| alapmanager effectlist dices ranking |
	alapmanager := Lapmanager createWith: 30.

	effectlist := OrderedCollection new.
	effectlist add: (AtomicBomb at: 20).
	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 5 10 7)).

	game := Game
		        createShipPlayer: 3
		        lengthOfBoard: 30
		        dices: dices
		        and: effectlist.
	ranking:= game ranking.
	self assert: (ranking first id) equals: 3 .
	self assert: (ranking second id) equals: 2 .
	self assert: (ranking third id) equals: 1 .
	game play.
	game play.
	game play.
	ranking:= game ranking.
	self assert: (ranking first id) equals: 2 .
	self assert: (ranking second id) equals: 3 .
	self assert: (ranking third id) equals: 1 .
]

{ #category : 'tests' }
ShipGameTest >> testShipGameCanMoveTheCreatedShips [

	| alapmanager effectlist dices |
	alapmanager := Lapmanager createWith: 20.

	effectlist := OrderedCollection new.

	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 5 )).
	dices add: (ChargeDice createWith: #( 5 )).

	game := Game
		        createShipPlayer: 1
		        lengthOfBoard: 30
		        dices: dices
		        and: effectlist.

	game play.
	self assert: ((game ship: 1) isAt: 10)
]

{ #category : 'tests' }
ShipGameTest >> testcreateAShipGamepasaturnoconatomicbomb [

	| alapmanager effectlist dices |
	alapmanager := Lapmanager createWith: 30.

	effectlist := OrderedCollection new.
	effectlist add: (AtomicBomb at: 20).
	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 5 )).
	dices add: (ChargeDice createWith: #( 5 )).

	game := Game
		        createShipPlayer: 2
		        lengthOfBoard: 30
		        dices: dices
		        and: effectlist.

	game play.
	game play.
	self assert: ((game ship: 1) isAt: 10).
	self assert: ((game ship: 2) isAt: 10).
	game play.
	self assert: ((game ship: 1) isAt: 0).
	self assert: ((game ship: 2) isAt: 0)
]
