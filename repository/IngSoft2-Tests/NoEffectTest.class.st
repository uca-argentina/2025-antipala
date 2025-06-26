Class {
	#name : 'NoEffectTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
NoEffectTest >> testNoEffectShouldntMoveTheShip [

	| tiles dices game |
	tiles := OrderedCollection new.
	20 timesRepeat: [ tiles add: (NoEffect create)].

	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 5 )).

	game := Game createOn: tiles toPlayWith: dices withARequired: 3 andWithThePlayers: 3.

	game play.
	self assert: ((game ship: 1) isAt:6)
]
