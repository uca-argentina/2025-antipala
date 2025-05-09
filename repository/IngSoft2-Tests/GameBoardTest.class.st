Class {
	#name : 'GameBoardTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
GameBoardTest >> should: anErrorBlock raise: anErrorClass withMessageText: errorMessage [

self
	should: anErrorBlock
	raise: anErrorClass
	withExceptionDo: [ :error | self assert: (error messageText)
			equals: errorMessage ]. 
	
	
]

{ #category : 'tests' }
GameBoardTest >> testGameBoardCanMoveAShip [
	| tablero naveActual aPositionY aPositionZ wormhole |

	"despues setear el agujero"
	aPositionY:=10.
	aPositionZ:=30.
	wormhole:= WormHole at:aPositionY and: aPositionZ.
	
	tablero := GameBoard setSquares: 40 setWormhole: wormhole.
	naveActual:= Ship create:1.
	tablero move: naveActual with: 3.
	
	self assert: naveActual position equals: 3.
]

{ #category : 'tests' }
GameBoardTest >> testGameBoardShouldThrowErrorWhenInitialiceSquaresWith1 [
self
	should:[GameBoard setSquares: 3 setWormhole:[ WormHole at: 2 and: 3]]
	raise: Error
	withMessageText: 'The number of squares should be more than 3'.
]

{ #category : 'tests' }
GameBoardTest >> testShipCanUseTheWormHoleYposition [
	| tablero naveActual aPositionY aPositionZ wormhole |
	
	aPositionY:=10.
	aPositionZ:=30.
	wormhole:= WormHole at:aPositionY and: aPositionZ.
	
	tablero := GameBoard setSquares: 10 setWormhole: wormhole .
	naveActual:= Ship create:1.
	tablero move: naveActual with: 10.
	
	self assert: naveActual position equals: 30.
]

{ #category : 'tests' }
GameBoardTest >> testShipCanUseTheWormHoleZposition [
	| tablero naveActual aPositionY aPositionZ wormhole |
	
	aPositionY:=10.
	aPositionZ:=30.
	wormhole:= WormHole at:aPositionY and: aPositionZ.
	
	tablero := GameBoard setSquares: 10 setWormhole: wormhole .
	naveActual:= Ship create:1.
	tablero move: naveActual with: 30.
	
	self assert: naveActual position equals: 10.
]
