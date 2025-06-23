Class {
	#name : 'ShipGameTest',
	#superclass : 'TestCase',
	#instVars : [
		'game'
	],
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
ShipGameTest >> should: anErrorBlock raise: anErrorClass withMessageText: errorMessage [

	self
		should: anErrorBlock
		raise: anErrorClass
		withExceptionDo: [ :error |
		self assert: error messageText equals: errorMessage ]
]

{ #category : 'tests' }
ShipGameTest >> testCannotCreateGameWithoutDices [

	| effectlist dices |
	effectlist := OrderedCollection new.
	effectlist add: (AtomicBomb at: 20).
	dices := OrderedCollection new.
	self
		should: [Game
		        createWith: 30
		        and: dices
		        and: effectlist
		        and: 3.]
		raise: Error
		withMessageText: 'you cant play without dices'
]

{ #category : 'tests' }
ShipGameTest >> testGameCanBePlayedWithoutEfects [

	| effectlist dices |
	effectlist := OrderedCollection new.
	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 5 )).
	game := Game
		        createWith: 30
		        and: dices
		        and: effectlist
		        and: 3.
	game addShip.
	self shouldnt: game play raise: Error
]

{ #category : 'tests' }
ShipGameTest >> testGameCanTellTheRanking [

	| effectlist dices ranking |

	effectlist := OrderedCollection new.
	effectlist add: (AtomicBomb at: 20).
	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 5 10 7 )).

	game := Game
		        createWith: 30
		        and: dices
		        and: effectlist
		        and: 3.
	game addShip.
	game addShip.
	game addShip.
	ranking := game ranking.
	self assert: ranking first id equals: 3.
	self assert: ranking second id equals: 2.
	self assert: ranking third id equals: 1.
	game play.
	game play.
	game play.
	ranking := game ranking.
	self assert: ranking first id equals: 2.
	self assert: ranking second id equals: 3.
	self assert: ranking third id equals: 1
]

{ #category : 'tests' }
ShipGameTest >> testGameCannotStartWithoutShips [

	| effectlist dices |
	effectlist := OrderedCollection new.
	effectlist add: (AtomicBomb at: 20).
	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 5 )).
	dices add: (ChargeDice createWith: #( 5 )).
	game := Game
		        createWith: 30
		        and: dices
		        and: effectlist
		        and: 3.
	self
		should: [ game play ]
		raise: Error
		withMessageText: 'you cant play without ships'
]

{ #category : 'tests' }
ShipGameTest >> testGameCantAddShipsWhenTheGameHasStarted [

	| effectlist dices |
	effectlist := OrderedCollection new.
	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 5 )).
	game := Game
		        createWith: 30
		        and: dices
		        and: effectlist
		        and: 3.
	game addShip.
	game play.
	self
		should: [ game addShip ]
		raise: Error
		withMessageText: 'The game started, you cant add ships'
]

{ #category : 'tests' }
ShipGameTest >> testShipGameCanMoveTheCreatedShips [

	|  effectlist dices |

	effectlist := OrderedCollection new.

	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 5 )).
	dices add: (ChargeDice createWith: #( 5 )).

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
ShipGameTest >> testTheGameCanBeWinned [

	| effectlist dices |
	effectlist := OrderedCollection new.
	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 30 )).
	game := Game
		        createWith: 10
		        and: dices
		        and: effectlist
		        and: 3.
	game addShip.

	game play.
	self assert: game winner equals: (game ship: 1).
]

{ #category : 'tests' }
ShipGameTest >> testTheGameCantBePlayedOnceItFinished [

	| effectlist dices |
	effectlist := OrderedCollection new.
	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 30 )).
	game := Game
		        createWith: 10
		        and: dices
		        and: effectlist
		        and: 3.
	game addShip.

	game play.
	self
		should: [ game play ]
		raise: Error
		withMessageText: 'the game ended'
]

{ #category : 'tests' }
ShipGameTest >> testThePlayerCantRepostFuelOnceItFinished [

	| effectlist dices |
	effectlist := OrderedCollection new.
	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 30 )).
	game := Game
		        createWith: 10
		        and: dices
		        and: effectlist
		        and: 3.
	game addShip.

	game play.
	self
		should: [ game repostFuel ]
		raise: Error
		withMessageText: 'the game ended'
]

{ #category : 'tests' }
ShipGameTest >> testcreateAShipGamepasaturnoconatomicbomb [

	|  effectlist dices |

	effectlist := OrderedCollection new.
	effectlist add: (AtomicBomb at: 20).
	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 5 )).
	dices add: (ChargeDice createWith: #( 5 )).
	game := Game
		        createWith: 30
		        and: dices
		        and: effectlist
		        and: 3.
	game addShip.
	game addShip.

	game play.
	game play.
	self assert: ((game ship: 1) isAt: 10).
	self assert: ((game ship: 2) isAt: 10).
	game play.
	self assert: ((game ship: 1) isAt: 0).
	self assert: ((game ship: 2) isAt: 0)
]
