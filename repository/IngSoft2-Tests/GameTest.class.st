Class {
	#name : 'GameTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'asserting' }
GameTest >> assert: aGame Fuel: anInteger equals: anInteger3 [ 
	self shouldBeImplemented.
]

{ #category : 'asserting' }
GameTest >> should: anErrorBlock raise: anErrorClass withMessageText: errorMessage [

self
	should: anErrorBlock
	raise: anErrorClass
	withExceptionDo: [ :error | self assert: (error messageText)
			equals: errorMessage ]. 
]

{ #category : 'tests' }
GameTest >> testAShipCanAdvance [

	| game throw |
	game := Game test.

	throw := game throwDices.
	
	self assert: game hasEnded equals: false

	"
Bucle:
	tirar dices
	mover nave
	terminojuego
	cambiar naveActual
"
]

{ #category : 'tests' }
GameTest >> testAShipCannotPlayWhenTheGameFinish [

	| game count |
	game := Game test.

	count := 0.
	[ count < 16 ] whileTrue: [
		count := count + 1.
		game throwDices ].

	self
		should: [ game throwDices ]
		raise: Error
		withMessageText: 'The game ended'
]

{ #category : 'tests' }
GameTest >> testAllShipsCanPlayARound [

	| game throw |
	game := Game test.

	throw := game throwDices. "Hace avazar a la nave"
	self assert: throw equals: 'the ship 1 moves'.

	throw := game throwDices. "Hace avazar a la nave"
	self assert: throw equals: 'the ship 2 moves'.

	throw := game throwDices. "Hace avazar a la nave"
	self assert: throw equals: 'the ship 3 moves'.

	self assert: game hasEnded equals: false

]

{ #category : 'tests' }
GameTest >> testAllShipsCanPlaySeveralRounds [

	| game throw |
	game := Game test.

	throw := game throwDices. "Hace avazar a la nave"
	self assert: throw equals: 'the ship 1 moves'.

	throw := game throwDices. "Hace avazar a la nave"
	self assert: throw equals: 'the ship 2 moves'.

	throw := game throwDices. "Hace avazar a la nave"
	self assert: throw equals: 'the ship 3 moves'.

	throw := game throwDices. "Hace avazar a la nave"
	self assert: throw equals: 'the ship 1 moves'.

	self assert: game hasEnded equals: false

]

{ #category : 'tests' }
GameTest >> testTheGameCanDecreaseFuel [

	| game|
	game := Game test.
	game throwDices.
	self assert: (game Fuel:1 )equals: 95
]

{ #category : 'tests' }
GameTest >> testTheGameCanDecreaseFuelOfVariousShips [

	| game|
	game := Game test.
	game throwDices.
	self assert: (game Fuel:2 ) equals: 100
]

{ #category : 'tests' }
GameTest >> testTheGameCanFinish [

	| game count |
	game := Game test.

	count := 0.
	[ count < 16] whileTrue: [
		count := count + 1.
		game throwDices ].

	self deny: game hasEnded equals: false.
	self assert: game winner equals: '1'
	"winner ship: 1"
]

{ #category : 'tests' }
GameTest >> testTheGameCanShowPosition [

	| game count |
	game := Game test.

	count := 0.
	[ count < 16 ] whileTrue: [
		count := count + 1.
		game throwDices ].

self assert: (game showShipPosition: 1) equals: 50.

self assert: (game showShipPosition: 2) equals: 45.

self assert: (game showShipPosition: 3) equals: 45.
self assert: game hasEnded equals: true
]

{ #category : 'tests' }
GameTest >> testTheGameCanTellFuel [

	| game|
	game := Game test.
	self assert: (game Fuel:1 )equals: 100
]

{ #category : 'tests' }
GameTest >> testTheGameCanTellWhoWin [

	| game count |
	game := Game test.

	count := 0.
	[ count < 16] whileTrue: [
		count := count + 1.
		game throwDices ].

	self assert: game hasEnded equals: true
]

{ #category : 'tests' }
GameTest >> testTheGameShouldntFinishWhenStarted [

	| game  |
	game := Game test.
	self assert: game hasEnded equals: false
]
