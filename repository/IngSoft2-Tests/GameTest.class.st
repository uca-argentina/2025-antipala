Class {
	#name : 'GameTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

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
