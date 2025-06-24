Class {
	#name : 'HyperGravityTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
HyperGravityTest >> testAShipThatShouldntBeAbleToLeaveTheHyperGravity [

	| effectlist game dices anHyperGravity |

	effectlist := OrderedCollection new.
	anHyperGravity := HyperGravity at: 5 with: 10.
	effectlist add: anHyperGravity.

	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 5 )).

	game := Game
		        createWith: 20
		        and: dices
		        and: effectlist
		        and: 3.
	game addShip.
	self assert: ((game ship: 1) isAt: 0).

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

	| effectlist game dices anHyperGravity |

	effectlist := OrderedCollection new.
	anHyperGravity := HyperGravity at: 5 with: 10.
	effectlist add: anHyperGravity.

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
	game play.
	game play.
	self assert: ((game ship: 1) isAt: 5).
	self assert: ((game ship: 2) isAt: 5).
	self assert: ((game ship: 3) isAt: 5)
	"en teoria nunca puede salir del HyperGravity con ese dado"
]

{ #category : 'tests' }
HyperGravityTest >> testShipsCanExitTheHyperGravity [

	| effectlist game dices anHyperGravity |
	effectlist := OrderedCollection new.
	anHyperGravity := HyperGravity at: 5 with: 10.
	effectlist add: anHyperGravity.

	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 5 5 10 )).

	game := Game
		        createWith: 20
		        and: dices
		        and: effectlist
		        and: 3.
	game addShip.
	game play.
	self assert: ((game ship: 1) isAt: 5).
	game play.
	self assert: ((game ship: 1) isAt: 5). 
	game play.
	self assert: ((game ship: 1) isAt: 15) 
]

{ #category : 'tests' }
HyperGravityTest >> testShipsShouldntGoForwardWhenTheyStepOnTheBlackHoleForTheFirstTime [

	| effectlist game dices anHyperGravity |
	effectlist := OrderedCollection new.
	anHyperGravity := HyperGravity at: 10 with: 5.
	effectlist add: anHyperGravity.

	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 10 )).

	game := Game
		        createWith: 20
		        and: dices
		        and: effectlist
		        and: 3.
	game addShip.
	game play.
	self assert: ((game ship: 1) isAt: 10)
]

{ #category : 'tests' }
HyperGravityTest >> testTheHyperGravityCanBeActivatedSeveralTimes [

	| effectlist game dices anHyperGravity |
	effectlist := OrderedCollection new.
	anHyperGravity := HyperGravity at: 10 with: 5.
	effectlist add: anHyperGravity.

	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 10 5 5)).

	game := Game
		        createWith: 25
		        and: dices
		        and: effectlist
		        and: 3.
	game addShip.
	game addShip.
	game play.
	game play.
	self assert: ((game ship: 1) isAt: 10).
	self assert: ((game ship: 2) isAt: 5).
	game play.
	game play.
	self assert: ((game ship: 1) isAt: 20).
	self assert: ((game ship: 2) isAt: 10) "si sigue activo, lo mandaria al casillero 20"
]
