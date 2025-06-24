Class {
	#name : 'AtomicBombTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
AtomicBombTest >> testAtomicBombAffectsAllShips [

	| anAtomicBomb effectlist game dices |

	effectlist := OrderedCollection new.
	anAtomicBomb := AtomicBomb at: 10.
	effectlist add: anAtomicBomb.

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
	self assert: ((game ship: 1) isAt: 5).
	self assert: ((game ship: 2) isAt: 5).
	self assert: ((game ship: 3) isAt: 5).
	game play.

	self assert: ((game ship: 1) isAt: 0).
	self assert: ((game ship: 2) isAt: 0).
	self assert: ((game ship: 3) isAt: 0)
]

{ #category : 'tests' }
AtomicBombTest >> testBanana [
]
