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

	| dices tiles |
	tiles := OrderedCollection new.
	20 timesRepeat: [ tiles add: (NoEffect create)].

	dices := OrderedCollection new.
	self
		should: [Game createOn: tiles toPlayWith: dices withARequired: 3 andWithThePlayers: 3.]
		raise: Error
		withMessageText: 'you cant play without dices'
]

{ #category : 'tests' }
ShipGameTest >> testGameCanBePlayedWithoutEfects [

	| tiles dices |
	tiles := OrderedCollection new.
	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 5 )).
	self
		should: [Game createOn: tiles toPlayWith: dices withARequired: 3 andWithThePlayers: 3.]
		raise: Error
		withMessageText: 'you cant play without tiles'
]

{ #category : 'tests' }
ShipGameTest >> testGameCanTellTheRanking [

	| dices ranking tiles |

	tiles := OrderedCollection new.
	20 timesRepeat: [ tiles add: (NoEffect create)].
	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 5 10 7 )).

	game := Game createOn: tiles toPlayWith: dices withARequired: 3 andWithThePlayers: 3.
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

	| tiles dices |
	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 5 )).
	dices add: (ChargeDice createWith: #( 5 )).
	tiles := OrderedCollection new.
	20 timesRepeat: [ tiles add: (NoEffect create)].

	game := Game createOn: tiles toPlayWith: dices withARequired: 3 andWithThePlayers: 0.
	self
		should: [ game play ]
		raise: Error
		withMessageText: 'you cant play without ships'
]

{ #category : 'tests' }
ShipGameTest >> testShipGameCanMoveTheCreatedShips [

	|  tiles dices |

	tiles := OrderedCollection new.
	20 timesRepeat: [ tiles add: (NoEffect create)].
	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 5 )).

	game := Game createOn: tiles toPlayWith: dices withARequired: 3 andWithThePlayers: 1.
	game play.
	game play.
	self assert: ((game ship: 1) isAt: 11)
]

{ #category : 'tests' }
ShipGameTest >> testTheGameCanBeWinned [

	| tiles dices |
	tiles := OrderedCollection new.
	10 timesRepeat: [ tiles add: (NoEffect create)].
	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 30 )).

	game := Game createOn: tiles toPlayWith: dices withARequired: 3 andWithThePlayers: 2.

	game play.
	self assert: game winner equals: (game ship: 1).
]

{ #category : 'tests' }
ShipGameTest >> testTheGameCantBePlayedOnceItFinished [

	| tiles dices |
	tiles := OrderedCollection new.
	10 timesRepeat: [ tiles add: (NoEffect create)].
	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 30)).

	game := Game createOn: tiles toPlayWith: dices withARequired: 3 andWithThePlayers: 3.

	game play.
	self
		should: [ game play ]
		raise: Error
		withMessageText: 'the game ended'
]

{ #category : 'tests' }
ShipGameTest >> testThePlayerCanReciveANegativeReward [

	| tiles dices |
	tiles := OrderedCollection new.
	20 timesRepeat: [ tiles add: (NoEffect create)].
	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #(10 9 )).

	game := Game createOn: tiles toPlayWith: dices withARequired: 3 andWithThePlayers: 1.

	game play.
	self assert: ((game ship: 1) isAt: 11).
	game repostFuel.
	self assert: (game ship: 1) fuel equals: 19
]

{ #category : 'tests' }
ShipGameTest >> testThePlayerCanReciveAPositiveReward [

	| tiles dices |
	tiles := OrderedCollection new.
	20 timesRepeat: [ tiles add: (NoEffect create)].
	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 10 7 )).

	game := Game createOn: tiles toPlayWith: dices withARequired: 3 andWithThePlayers: 1.

	game play.
	self assert: ((game ship: 1) isAt: 11).
	game repostFuel.
	self assert: (game ship: 1) fuel equals: 21
]

{ #category : 'tests' }
ShipGameTest >> testThePlayerCantRepostFuelOnceItFinished [

	| tiles dices |
	tiles := OrderedCollection new.
	10 timesRepeat: [ tiles add: (NoEffect create)].
	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 30 )).

	game := Game createOn: tiles toPlayWith: dices withARequired: 3 andWithThePlayers: 1.

	game play.
	self
		should: [ game repostFuel ]
		raise: Error
		withMessageText: 'the game ended'
]

{ #category : 'tests' }
ShipGameTest >> testcreateAShipGamepasaturnoconatomicbomb [

	|  tiles dices |

	tiles := OrderedCollection new.
	22 timesRepeat: [ tiles add: (NoEffect create)].
	tiles at: 21 put: AtomicBomb create.
	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #(10 )).

	game := Game createOn: tiles toPlayWith: dices withARequired: 3 andWithThePlayers: 2.

	game play.
	game play.
	self assert: ((game ship: 1) isAt: 11).
	self assert: ((game ship: 2) isAt: 11).
	game play.
	self assert: ((game ship: 1) isAt: 1).
	self assert: ((game ship: 2) isAt: 1)
]
