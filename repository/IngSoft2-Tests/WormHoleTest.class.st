Class {
	#name : 'WormHoleTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
WormHoleTest >> testAShipCanEnterTheWormHole [

	|  game dices  tiles |
	tiles := OrderedCollection new.
	20 timesRepeat: [ tiles add: (NoEffect create)].
	tiles at: 9 put: (WormHole createWith: 2).
	tiles at: 11 put: (WormHole createWith: -2).
	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 10 )).

	game := Game createOn: tiles toPlayWith: dices withARequired: 3 andWithThePlayers: 1.
	game play.
	self assert: ((game ship:1) isAt: 9)
]

{ #category : 'tests' }
WormHoleTest >> testIfWeAreInTheYPositionTheWormHoleKnowsHowMuchToAddToTheDiceToBeInZ [

	|  game dices  tiles |
	tiles := OrderedCollection new.
	20 timesRepeat: [ tiles add: (NoEffect create)].
	tiles at: 11 put: (WormHole createWith: 2).
	tiles at: 13 put: (WormHole createWith: -2).
	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 10 )).

	game := Game createOn: tiles toPlayWith: dices withARequired: 3 andWithThePlayers: 1.
	game play.
	self assert: ((game ship:1) isAt: 13)
]
