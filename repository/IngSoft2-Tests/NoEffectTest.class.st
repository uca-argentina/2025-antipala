Class {
	#name : 'NoEffectTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
NoEffectTest >> testNoEffectShouldntMoveTheShip [

	| effectlist dices game |
	effectlist := OrderedCollection new.
	effectlist add: (NoEffect at: 5).

	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 5 )).

	game := Game
		        createWith: 20
		        and: dices
		        and: effectlist
		        and: 3.
	game addShip.

	game play.
	self assert: ((game ship: 1) isAt: 5)
]
