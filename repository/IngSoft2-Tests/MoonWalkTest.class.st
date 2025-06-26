Class {
	#name : 'MoonWalkTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
MoonWalkTest >> testMoonWalkAffectsAllShipsExceptTheOneThatTriggersIt [

	|  game dices  tiles |
	tiles := OrderedCollection new.
	20 timesRepeat: [ tiles add: (NoEffect create)].
	tiles at: 10 put: (MoonWalk createWith: 3).
	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 5 )).

	game := Game createOn: tiles toPlayWith: dices withARequired: 3 andWithThePlayers: 3.
	game play.
	game play.
	game play.
	self assert: ((game ship: 1) isAt: 6).
	self assert: ((game ship: 2) isAt: 6).
	self assert: ((game ship: 3) isAt: 6).
	game play.

	self assert: ((game ship: 1) isAt: 11).
	self assert: ((game ship: 2) isAt: 3).
	self assert: ((game ship: 3) isAt: 3)
]
