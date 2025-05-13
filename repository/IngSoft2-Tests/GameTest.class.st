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
	| game numberOfSquares aPositionY aPositionZ wormhole gameboard dices ships throw |
	numberOfSquares := 50.
	aPositionY:=10.
	aPositionZ:=30.
	wormhole:= WormHole at:aPositionY and: aPositionZ.
	
	gameboard := GameBoard setSquares: numberOfSquares setWormhole: wormhole .
	
	dices:= OrderedCollection new.
	dices add: (Dice withFace: 10).
	
	ships := OrderedCollection new.
	ships add: ( Ship create:1 ).
	
	game := Game setDices: dices setGameBoard: gameboard setShips: ships.
	
	throw:= game throwDices.
	
	
	
	self assert: game terminoJuego equals: 'The game keeps going...'.

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

	| game numberOfSquares aPositionY aPositionZ wormhole gameboard dices ships |
	numberOfSquares := 15.
	aPositionY:=5.
	aPositionZ:=10.
	wormhole:= WormHole at:aPositionY and: aPositionZ.
	
	gameboard := GameBoard setSquares: numberOfSquares setWormhole: wormhole .
	
	dices:= OrderedCollection new.
	dices add: (Dice withFace: 6).
		
	ships := OrderedCollection new.
	ships add: ( Ship create:1 ).
	
	game := Game setDices: dices setGameBoard: gameboard setShips: ships.
	game setearTerminoElJuego.
	self
		should: [ game throwDices]
		raise: Error
		withMessageText:'The game ended'.
]

{ #category : 'tests' }
GameTest >> testAllShipsCanPlayARound [
	| game numberOfSquares aPositionY aPositionZ wormhole gameboard dados ships throw |
	numberOfSquares := 50.
	aPositionY:=10.
	aPositionZ:=30.
	wormhole:= WormHole at:aPositionY and: aPositionZ.
	
	gameboard := GameBoard setSquares: numberOfSquares setWormhole: wormhole .
	
	dados:= OrderedCollection new.
	dados add: (Dice withFace: 10).
	
	ships := OrderedCollection new.
	ships add: ( Ship create:1 ).
	ships add: ( Ship create:2 ).
	ships add: ( Ship create:3 ).
		
	game := Game setDices: dados setGameBoard: gameboard setShips: ships.
	
	throw:= game throwDices. "Hace avazar a la nave"
	self assert: throw equals: 'the ship 1 moves'.
	
	throw:= game throwDices. "Hace avazar a la nave"
	self assert: throw equals: 'the ship 2 moves'.	

	throw:= game throwDices. "Hace avazar a la nave"
	self assert: throw equals: 'the ship 3 moves'.
		
	self assert: game terminoJuego equals: 'The game keeps going...'.
	

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
	| game numberOfSquares aPositionY aPositionZ wormhole gameboard dices ships throw |
	numberOfSquares := 50.
	aPositionY:=10.
	aPositionZ:=30.
	wormhole:= WormHole at:aPositionY and: aPositionZ.
	
	gameboard := GameBoard setSquares: numberOfSquares setWormhole: wormhole .
	
	dices:= OrderedCollection new.
	dices add: (Dice withFace: 10).
	
	ships := OrderedCollection new.
	ships add: ( Ship create:1 ).
	ships add: ( Ship create:2 ).
	ships add: ( Ship create:3 ).
		
	game := Game setDices: dices setGameBoard: gameboard setShips: ships.
	
	throw:= game throwDices. "Hace avazar a la nave"
	self assert: throw equals: 'the ship 1 moves'.
	
	self assert: game terminoJuego equals: 'The game keeps going...'.
	
	throw:= game throwDices. "Hace avazar a la nave"
	self assert: throw equals: 'the ship 2 moves'.	

	self assert: game terminoJuego equals: 'The game keeps going...'.

	throw:= game throwDices. "Hace avazar a la nave"
	self assert: throw equals: 'the ship 3 moves'.
	
	self assert: game terminoJuego equals: 'The game keeps going...'.
	
	throw:= game throwDices. "Hace avazar a la nave"
	self assert: throw equals: 'the ship 1 moves'.
		
	self assert: game terminoJuego equals: 'The game keeps going...'.
	

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
	| game numberOfSquares aPositionY aPositionZ wormhole gameboard dices ships count |
	numberOfSquares := 15.
	aPositionY:=5.
	aPositionZ:=10.
	wormhole:= WormHole at:aPositionY and: aPositionZ.
	
	gameboard := GameBoard setSquares: numberOfSquares setWormhole: wormhole .
	
	dices:= OrderedCollection new.
	dices add: (Dice withFace: 6).
		
	ships := OrderedCollection new.
	ships add: ( Ship create:1 ).
	ships add: ( Ship create:2 ).
	ships add: ( Ship create:3 ).
	
	game := Game setDices: dices setGameBoard: gameboard setShips: ships.
	
	count := 0.
	[ count <1000 and: (game terminoJuego ='The game keeps going...')] whileTrue: [
  	 count := count + 1.
	game throwDices .
	].

	self deny: (game terminoJuego) equals: 'The game keeps going...'.
	"winner ship: 1"
]

{ #category : 'tests' }
GameTest >> testTheGameCanShowPosition [
	| game numberOfSquares aPositionY aPositionZ wormhole gameboard dices ships count shipIsFinish|
	numberOfSquares := 15.
	aPositionY:=5.
	aPositionZ:=10.
	wormhole:= WormHole at:aPositionY and: aPositionZ.
	
	gameboard := GameBoard setSquares: numberOfSquares setWormhole: wormhole .
	
	dices:= OrderedCollection new.
	dices add: (Dice withFace: 6).
		
	ships := OrderedCollection new.
	shipIsFinish:=Ship create:1.
	shipIsFinish setPosition:15.
	ships add: (shipIsFinish).
	
	game := Game setDices: dices setGameBoard: gameboard setShips: ships.
	
	count := 0.
	[ count <1000 and: (game terminoJuego ='The game keeps going...')] whileTrue: [
  	 count := count + 1.
	game throwDices .
	].

	self assert: (game showPosition ) equals: 'The ship: 1, ended in the position: 15 '.
	self assert: (game terminoJuego) equals: 'Winner ship: 1'.

]

{ #category : 'tests' }
GameTest >> testTheGameCanShowXPosition [
	| game numberOfSquares aPositionY aPositionZ wormhole gameboard dices ships count shipIsFinish shipIsFinish2|
	numberOfSquares := 15.
	aPositionY:=5.
	aPositionZ:=10.
	wormhole:= WormHole at:aPositionY and: aPositionZ.
	
	gameboard := GameBoard setSquares: numberOfSquares setWormhole: wormhole .
	
	dices:= OrderedCollection new.
	dices add: (Dice withFace: 6).
		
	ships := OrderedCollection new.
	shipIsFinish:=Ship create:1.
	shipIsFinish setPosition:15.
	shipIsFinish2:=Ship create:2.
	shipIsFinish2 setPosition:4.
	ships add: (shipIsFinish).
	ships add: (shipIsFinish2).
	
	game := Game setDices: dices setGameBoard: gameboard setShips: ships.
	
	count := 0.
	[ count <1000 and: (game terminoJuego ='El juego sigue')] whileTrue: [
  	 count := count + 1.
	game throwDices .
	].

	self assert: (game showPosition ) equals: 'The ship: 1, ended in the position: 15 The ship: 2, ended in the position: 4 '.
	
	
	self assert: (game terminoJuego) equals: 'Winner ship: 1'.

]

{ #category : 'tests' }
GameTest >> testTheGameCanTellWhoWin [
	| game numberOfSquares aPositionY aPositionZ wormhole gameboard dices ships count |
	numberOfSquares := 15.
	aPositionY:=5.
	aPositionZ:=10.
	wormhole:= WormHole at:aPositionY and: aPositionZ.
	
	gameboard := GameBoard setSquares: numberOfSquares setWormhole: wormhole .
	
	dices:= OrderedCollection new.
	dices add: (Dice withFace: 6).
		
	ships := OrderedCollection new.
	ships add: ( Ship create:1 ).
	
	game := Game setDices: dices setGameBoard: gameboard setShips: ships.
	
	count := 0.
	[ count <1000 and: (game terminoJuego ='The game keeps going...')] whileTrue: [
  	 count := count + 1.
	game throwDices .
	].

	self assert: (game terminoJuego) equals: 'Winner ship: 1'.

]

{ #category : 'tests' }
GameTest >> testTheGameShouldntFinishWhenStarted [
	| game numberOfSquares aPositionY aPositionZ wormhole gameboard dices ships |
	numberOfSquares := 50.
	aPositionY:=10.
	aPositionZ:=30.
	wormhole:= WormHole at:aPositionY and: aPositionZ.
	
	gameboard := GameBoard setSquares: numberOfSquares setWormhole: wormhole .
	
	dices:= OrderedCollection new.
	dices add: [Dice withFace: 10].
	
	ships := OrderedCollection new.
	ships add: ( Ship create:1 ).
	
	game := Game setDices: dices setGameBoard: gameboard setShips: ships.
	self assert: game terminoJuego equals: 'The game keeps going...'.
]
