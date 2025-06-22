Class {
	#name : 'HyperGravityTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'as yet unclassified' }
HyperGravityTest >> testAShipThatShouldntBeAbleToLeaveTheHyperGravity [

	| alapmanager effectlist game dices anHyperGravity |
	alapmanager := Lapmanager createWith: 20.

	effectlist := OrderedCollection new.
	anHyperGravity := HyperGravity atPosition: 5 withValue: 10.
	effectlist add: anHyperGravity.

	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #(5)).

	game := ShipGame
		        createShipPlayer: 1
		        lengthOfBoard: 20
		        dices: dices
		        and: effectlist.

	self assert: ((game ship: 1) isAt: 0).

	game play.
	self assert: ((game ship: 1) isAt: 5).
	game play.
	self assert: ((game ship: 1) isAt: 5).
	game play.
	self assert: ((game ship: 1) isAt: 5)
	"en teoria nunca puede salir del HyperGravity con ese dado"
]

{ #category : 'as yet unclassified' }
HyperGravityTest >> testHyperGravityCanHandleSeveralShips [

	| alapmanager effectlist game dices anHyperGravity |
	alapmanager := Lapmanager createWith: 20.

	effectlist := OrderedCollection new.
	anHyperGravity := HyperGravity atPosition: 5 withValue: 10.
	effectlist add: anHyperGravity.

	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #(5)).

	game := ShipGame
		        createShipPlayer: 3
		        lengthOfBoard: 20
		        dices: dices
		        and: effectlist.

	game play.
	game play.
	game play.
	self assert: ((game ship: 1) isAt: 5).
	self assert: ((game ship: 2) isAt: 5).
	self assert: ((game ship: 3) isAt: 5).
	game play.
	game play.
	game play.
	self assert: ((game ship: 1) isAt: 5).
	self assert: ((game ship: 2) isAt: 5).
	self assert: ((game ship: 3) isAt: 5)
	"en teoria nunca puede salir del HyperGravity con ese dado"
]

{ #category : 'tests' }
HyperGravityTest >> testShipsCanExitTheHyperGravity [

	| alapmanager effectlist game dices anHyperGravity |
	alapmanager := Lapmanager createWith: 20.

	effectlist := OrderedCollection new.
	anHyperGravity := HyperGravity atPosition: 5 withValue: 10.
	effectlist add: anHyperGravity.

	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 5 15 10 )).

	game := ShipGame
		        createShipPlayer: 1
		        lengthOfBoard: 20
		        dices: dices
		        and: effectlist.
	
	game play.
	self assert: ((game ship: 1) isAt: 5).
	game play.
	self assert: ((game ship: 1) isAt: 5). "Sale del HyperGravity"
	game play.
	self assert: ((game ship: 1) isAt: 15).
]
