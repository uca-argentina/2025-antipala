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
ShipGameTest >> testShipGameCanMoveTheCreatedShips [

	| alapmanager effectlist dices |
	alapmanager := Lapmanager createWith: 20.

	effectlist := OrderedCollection new.

	dices := OrderedCollection new.
	dices add: ChargeDice new.
	dices add: ChargeDice new.

	game := ShipGame
		        createShipPlayer: 1
		        lengthOfBoard: 30
		        dices: dices
		        and: effectlist.

	game play.
	self assert: ((game ship: 1) isAt: 10).
]

{ #category : 'tests' }
ShipGameTest >> testcreateAShipGamepasaturnoconatomicbomb [

	| alapmanager effectlist dices |
	alapmanager := Lapmanager createWith: 30.

	effectlist := OrderedCollection new.
	effectlist add: (AtomicBomb at: 20).
	dices := OrderedCollection new.
	dices add: ChargeDice new.
	dices add: ChargeDice new.

	game := ShipGame
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
	self assert: ((game ship: 2) isAt: 0).
]
