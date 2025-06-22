Class {
	#name : 'MoonWalkTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
MoonWalkTest >> testMoonWalkAffectsAllShipsExceptTheOneThatTriggersIt [

	| alapmanager effectlist game dices anMoonWalk |
	alapmanager := Lapmanager createWith: 20.

	effectlist := OrderedCollection new.
	anMoonWalk := MoonWalk at: 10 and: 3.
	effectlist add: anMoonWalk.

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

	self assert: ((game ship: 1) isAt: 10).
	self assert: ((game ship: 2) isAt: 2).
	self assert: ((game ship: 3) isAt: 2)
]
