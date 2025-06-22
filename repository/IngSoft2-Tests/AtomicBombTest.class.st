Class {
	#name : 'AtomicBombTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'as yet unclassified' }
AtomicBombTest >> testAtomicBombAffectsAllShips [

	| alapmanager anAtomicBomb effectlist game dices |
	alapmanager := Lapmanager createWith: 20.

	effectlist := OrderedCollection new.
	anAtomicBomb := AtomicBomb at: 10.
	effectlist add: anAtomicBomb.

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

	self assert: ((game ship: 1) isAt: 0).
	self assert: ((game ship: 2) isAt: 0).
	self assert: ((game ship: 3) isAt: 0)
]
