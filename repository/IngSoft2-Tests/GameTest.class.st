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
	
	
	
	self assert: game terminoJuego equals: 'no'.
	

"
Bucle:
	tirar dados
	mover nave
	terminojuego
	cambiar naveActual
"
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
	self assert: game terminoJuego equals: 'no'.
]
