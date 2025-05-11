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
	| game numberOfSquares aPositionY aPositionZ wormhole tablero dados naves tirada |
	numberOfSquares := 50.
	aPositionY:=10.
	aPositionZ:=30.
	wormhole:= WormHole at:aPositionY and: aPositionZ.
	
	tablero := GameBoard setSquares: numberOfSquares setWormhole: wormhole .
	
	dados:= OrderedCollection new.
	dados add: (Dice withFace: 10).
	
	naves := OrderedCollection new.
	naves add: ( Ship create:1 ).
	
	game := Game setDices: dados setGameBoard: tablero setShips: naves.
	
	tirada:= game throwDices.
	
	
	
	self assert: game terminoJuego equals: 'El juego sigue'.

"
Bucle:
	tirar dados
	mover nave
	terminojuego
	cambiar naveActual
"
]

{ #category : 'tests' }
GameTest >> testAShipCannotPlayWhenTheGameFinish [

	| game numberOfSquares aPositionY aPositionZ wormhole tablero dados naves count tirada |
	numberOfSquares := 15.
	aPositionY:=5.
	aPositionZ:=10.
	wormhole:= WormHole at:aPositionY and: aPositionZ.
	
	tablero := GameBoard setSquares: numberOfSquares setWormhole: wormhole .
	
	dados:= OrderedCollection new.
	dados add: (Dice withFace: 6).
		
	naves := OrderedCollection new.
	naves add: ( Ship create:1 ).
	
	game := Game setDices: dados setGameBoard: tablero setShips: naves.
	game setearTerminoElJuego.
	self
		should: [ game throwDices]
		raise: Error
		withMessageText:'el juego termino'.
]

{ #category : 'tests' }
GameTest >> testAllShipsCanPlayARound [
	| game numberOfSquares aPositionY aPositionZ wormhole tablero dados naves tirada |
	numberOfSquares := 50.
	aPositionY:=10.
	aPositionZ:=30.
	wormhole:= WormHole at:aPositionY and: aPositionZ.
	
	tablero := GameBoard setSquares: numberOfSquares setWormhole: wormhole .
	
	dados:= OrderedCollection new.
	dados add: (Dice withFace: 10).
	
	naves := OrderedCollection new.
	naves add: ( Ship create:1 ).
	naves add: ( Ship create:2 ).
	naves add: ( Ship create:3 ).
		
	game := Game setDices: dados setGameBoard: tablero setShips: naves.
	
	tirada:= game throwDices. "Hace avazar a la nave"
	self assert: tirada equals: 'the ship 1 moves'.
	
	tirada:= game throwDices. "Hace avazar a la nave"
	self assert: tirada equals: 'the ship 2 moves'.	

	tirada:= game throwDices. "Hace avazar a la nave"
	self assert: tirada equals: 'the ship 3 moves'.
		
	self assert: game terminoJuego equals: 'El juego sigue'.
	

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
	| game numberOfSquares aPositionY aPositionZ wormhole tablero dados naves tirada |
	numberOfSquares := 50.
	aPositionY:=10.
	aPositionZ:=30.
	wormhole:= WormHole at:aPositionY and: aPositionZ.
	
	tablero := GameBoard setSquares: numberOfSquares setWormhole: wormhole .
	
	dados:= OrderedCollection new.
	dados add: (Dice withFace: 10).
	
	naves := OrderedCollection new.
	naves add: ( Ship create:1 ).
	naves add: ( Ship create:2 ).
	naves add: ( Ship create:3 ).
		
	game := Game setDices: dados setGameBoard: tablero setShips: naves.
	
	tirada:= game throwDices. "Hace avazar a la nave"
	self assert: tirada equals: 'the ship 1 moves'.
	
	self assert: game terminoJuego equals: 'El juego sigue'.
	
	tirada:= game throwDices. "Hace avazar a la nave"
	self assert: tirada equals: 'the ship 2 moves'.	

	self assert: game terminoJuego equals: 'El juego sigue'.

	tirada:= game throwDices. "Hace avazar a la nave"
	self assert: tirada equals: 'the ship 3 moves'.
	
	self assert: game terminoJuego equals: 'El juego sigue'.
	
	tirada:= game throwDices. "Hace avazar a la nave"
	self assert: tirada equals: 'the ship 1 moves'.
		
	self assert: game terminoJuego equals: 'El juego sigue'.
	

"
Bucle:
	tirar dados
	mover nave
	terminojuego
	cambiar naveActual
"
]

{ #category : 'tests' }
GameTest >> testTheGameCanFinish [
	| game numberOfSquares aPositionY aPositionZ wormhole tablero dados naves count |
	numberOfSquares := 15.
	aPositionY:=5.
	aPositionZ:=10.
	wormhole:= WormHole at:aPositionY and: aPositionZ.
	
	tablero := GameBoard setSquares: numberOfSquares setWormhole: wormhole .
	
	dados:= OrderedCollection new.
	dados add: (Dice withFace: 6).
		
	naves := OrderedCollection new.
	naves add: ( Ship create:1 ).
	naves add: ( Ship create:2 ).
	naves add: ( Ship create:3 ).
	
	game := Game setDices: dados setGameBoard: tablero setShips: naves.
	
	count := 0.
	[ count <1000 and: (game terminoJuego ='El juego sigue')] whileTrue: [
  	 count := count + 1.
	game throwDices .
	].

	self deny: (game terminoJuego) equals: 'El juego sigue'.
	"La nave no avanza"
]

{ #category : 'tests' }
GameTest >> testTheGameCanShowPosition [
	| game numberOfSquares aPositionY aPositionZ wormhole tablero dados naves count naveIsFinish|
	numberOfSquares := 15.
	aPositionY:=5.
	aPositionZ:=10.
	wormhole:= WormHole at:aPositionY and: aPositionZ.
	
	tablero := GameBoard setSquares: numberOfSquares setWormhole: wormhole .
	
	dados:= OrderedCollection new.
	dados add: (Dice withFace: 6).
		
	naves := OrderedCollection new.
	naveIsFinish:=Ship create:1.
	naveIsFinish setPosition:15.
	naves add: (naveIsFinish).
	
	game := Game setDices: dados setGameBoard: tablero setShips: naves.
	
	count := 0.
	[ count <1000 and: (game terminoJuego ='El juego sigue')] whileTrue: [
  	 count := count + 1.
	game throwDices .
	].

	self assert: (game showPosition ) equals: 'La nave: 1 terminó en posición: 15 '.
	self assert: (game terminoJuego) equals: 'Gano la nave 1'.

]

{ #category : 'tests' }
GameTest >> testTheGameCanShowXPosition [
	| game numberOfSquares aPositionY aPositionZ wormhole tablero dados naves count naveIsFinish naveIsFinish2|
	numberOfSquares := 15.
	aPositionY:=5.
	aPositionZ:=10.
	wormhole:= WormHole at:aPositionY and: aPositionZ.
	
	tablero := GameBoard setSquares: numberOfSquares setWormhole: wormhole .
	
	dados:= OrderedCollection new.
	dados add: (Dice withFace: 6).
		
	naves := OrderedCollection new.
	naveIsFinish:=Ship create:1.
	naveIsFinish setPosition:15.
	naveIsFinish2:=Ship create:2.
	naveIsFinish2 setPosition:4.
	naves add: (naveIsFinish).
	naves add: (naveIsFinish2).
	
	game := Game setDices: dados setGameBoard: tablero setShips: naves.
	
	count := 0.
	[ count <1000 and: (game terminoJuego ='El juego sigue')] whileTrue: [
  	 count := count + 1.
	game throwDices .
	].

	self assert: (game showPosition ) equals: 'La nave: 1 terminó en posición: 15 La nave: 2 terminó en posición: 4 '.
	self assert: (game terminoJuego) equals: 'Gano la nave 1'.

]

{ #category : 'tests' }
GameTest >> testTheGameCanTellWhoWin [
	| game numberOfSquares aPositionY aPositionZ wormhole tablero dados naves count |
	numberOfSquares := 15.
	aPositionY:=5.
	aPositionZ:=10.
	wormhole:= WormHole at:aPositionY and: aPositionZ.
	
	tablero := GameBoard setSquares: numberOfSquares setWormhole: wormhole .
	
	dados:= OrderedCollection new.
	dados add: (Dice withFace: 6).
		
	naves := OrderedCollection new.
	naves add: ( Ship create:1 ).
	
	game := Game setDices: dados setGameBoard: tablero setShips: naves.
	
	count := 0.
	[ count <1000 and: (game terminoJuego ='El juego sigue')] whileTrue: [
  	 count := count + 1.
	game throwDices .
	].

	self assert: (game terminoJuego) equals: 'Gano la nave 1'.

]

{ #category : 'tests' }
GameTest >> testTheGameShouldntFinishWhenStarted [
	| game numberOfSquares aPositionY aPositionZ wormhole tablero dados naves |
	numberOfSquares := 50.
	aPositionY:=10.
	aPositionZ:=30.
	wormhole:= WormHole at:aPositionY and: aPositionZ.
	
	tablero := GameBoard setSquares: numberOfSquares setWormhole: wormhole .
	
	dados:= OrderedCollection new.
	dados add: [Dice withFace: 10].
	
	naves := OrderedCollection new.
	naves add: ( Ship create:1 ).
	
	game := Game setDices: dados setGameBoard: tablero setShips: naves.
	self assert: game terminoJuego equals: 'El juego sigue'.
]
