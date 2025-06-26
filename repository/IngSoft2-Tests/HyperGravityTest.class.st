Class {
	#name : 'HyperGravityTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
HyperGravityTest >> testAShipThatShouldntBeAbleToLeaveTheHyperGravity [


	| game dices tiles |
	tiles := OrderedCollection new.
	20 timesRepeat: [ tiles add: (NoEffect create)].
	tiles at: 5 put: (HyperGravity createWith: 10).
	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 4 )).

	game := Game createOn: tiles toPlayWith: dices withARequired: 3 andWithThePlayers: 1.
	self assert: ((game ship: 1) isAt: 1).

	game play.
	self assert: ((game ship: 1) isAt: 5).
	game play.
	self assert: ((game ship: 1) isAt: 5).
	game play.
	self assert: ((game ship: 1) isAt: 5).
	game play.
	self assert: ((game ship: 1) isAt: 5)
	"en teoria nunca puede salir del HyperGravity con ese dado, tampoco se deberia quedar sin combustible"
]

{ #category : 'tests' }
HyperGravityTest >> testHyperGravityCanHandleSeveralShips [

	| game dices tiles |
	tiles := OrderedCollection new.
	20 timesRepeat: [ tiles add: (NoEffect create)].
	tiles at: 5 put: (HyperGravity createWith: 10).
	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 4 )).

	game := Game createOn: tiles toPlayWith: dices withARequired: 3 andWithThePlayers: 3.
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

	| game dices tiles |
	tiles := OrderedCollection new.
	20 timesRepeat: [ tiles add: (NoEffect create)].
	tiles at: 5 put: (HyperGravity createWith: 10).
	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 4 5 10 )).

	game := Game createOn: tiles toPlayWith: dices withARequired: 3 andWithThePlayers: 1.
	game play.
	self assert: ((game ship: 1) isAt: 5).
	game play.
	self assert: ((game ship: 1) isAt: 5). 
	game play.
	self assert: ((game ship: 1) isAt: 15) 
]

{ #category : 'tests' }
HyperGravityTest >> testShipsShouldntGoForwardWhenTheyStepOnTheBlackHoleForTheFirstTime [

| game dices tiles |
	tiles := OrderedCollection new.
	20 timesRepeat: [ tiles add: (NoEffect create)].
	tiles at: 10 put: (HyperGravity createWith: 5).
	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 9 )).

	game := Game createOn: tiles toPlayWith: dices withARequired: 3 andWithThePlayers: 1.
	game play.
	self assert: ((game ship: 1) isAt: 10)
]

{ #category : 'tests' }
HyperGravityTest >> testTheHyperGravityCanBeActivatedSeveralTimes [

	| game dices tiles |
	tiles := OrderedCollection new.
	30 timesRepeat: [ tiles add: (NoEffect create)].
	tiles at: 10 put: (HyperGravity createWith: 5).
	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 9 )).

	game := Game createOn: tiles toPlayWith: dices withARequired: 3 andWithThePlayers: 2.
	game play.
	game repostFuel .
	self assert: ((game ship: 1) isAt: 10).
	self assert: ((game ship: 2) isAt: 1).
	game play.
	game play.
	self assert: ((game ship: 1) isAt: 19).
	self assert: ((game ship: 2) isAt: 10)
]
