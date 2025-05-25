Class {
	#name : 'GameTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

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



	self assert: game hasEnded equals: false.
	game showRanking.
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
	[ count < 10 ] whileTrue: [
		count := count + 1.
		game throwDices ].
	game showRanking.
	self
		should: [ game throwDices ]
		raise: Error
		withMessageText: 'The game ended'
]

{ #category : 'tests' }
GameTest >> testAShiprestartIffuelisEmpty [

	| game numberOfSquares aPositionY aPositionZ wormhole gameboard dices ships throw ship1|
	numberOfSquares := 15.
	aPositionY:=5.
	aPositionZ:=10.
	wormhole:= WormHole at:aPositionY and: aPositionZ.
	
	gameboard := GameBoard with: numberOfSquares and: wormhole .
	
	dices:= OrderedCollection new.
	dices add: ChargeDice new.
		
	ships := OrderedCollection new.
	ship1 :=Ship create:1.
	ship1 setfuel: 10.
	ships add: ( ship1 ).
	
	game := Game with: dices and: gameboard and: ships.
	
	throw:= game throwDices. "Hace avazar a la nave"
	self assert: throw equals: 'the ship 1 moves'.
	throw:= game throwDices. "Hace avazar a la nave"
	self assert: throw equals: '1 no tiene combustible'.
	throw:= game throwDices. "Hace avazar a la nave"
	self assert: throw equals: '1 no tiene combustible'.
	throw:= game throwDices. "Hace avazar a la nave"
	self assert: throw equals: 'the ship 1 moves'.

	
	
	
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

	self assert: game hasEnded equals: false.

	game showPositions
	"
Bucle:
	tirar dados
	mover nave
	terminojuego
	cambiar naveActual
"
]

{ #category : 'tests' }
GameTest >> testAllShipsCanPlaySeveralRounds [

	| game throw |
	game := Game test.

	throw := game throwDices. "Hace avazar a la nave"
	self assert: throw equals: 'the ship 1 moves'.

	self assert: game hasEnded equals: false.

	throw := game throwDices. "Hace avazar a la nave"
	self assert: throw equals: 'the ship 2 moves'.

	self assert: game hasEnded equals: false.

	throw := game throwDices. "Hace avazar a la nave"
	self assert: throw equals: 'the ship 3 moves'.

	self assert: game hasEnded equals: false.

	throw := game throwDices. "Hace avazar a la nave"
	self assert: throw equals: 'the ship 1 moves'.

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
GameTest >> testTheGameCanFinish [

	| game count |
	game := Game test.

	count := 0.
	[ count < 10 ] whileTrue: [
		count := count + 1.
		game throwDices ].

	self deny: game hasEnded equals: false.
	self assert: game winner equals: '1'.
	game showRanking
	"winner ship: 1"
]

{ #category : 'tests' }
GameTest >> testTheGameCanShowXPosition [

	| game count |
	game := Game test.

	count := 0.
	[ count < 10 ] whileTrue: [
		count := count + 1.
		game throwDices ].

	self
		assert: game showPosition
		equals:
		'The ship: 1, ended in the position: 0 The ship: 2, ended in the position: 10 The ship: 3, ended in the position: 10 '.

	self assert: game hasEnded equals: true.
	game showRanking
]

{ #category : 'tests' }
GameTest >> testTheGameCanTellWhoWin [

	| game count |
	game := Game test.

	count := 0.
	[ count < 10 ] whileTrue: [
		count := count + 1.
		game throwDices ].

	self assert: game hasEnded equals: true.
	self assert: game winner equals: '1'.
	game showRanking
]

{ #category : 'tests' }
GameTest >> testTheGameShouldntFinishWhenStarted [

	| game |

	game := Game test.
	self assert: game hasEnded equals: false
]
