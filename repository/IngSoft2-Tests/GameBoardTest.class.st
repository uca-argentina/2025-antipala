Class {
	#name : 'GameBoardTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
GameBoardTest >> testGameBoardCanMoveAShip [
	| naves tablero naveActual aPositionY aPositionZ wormhole |
	naves := OrderedCollection new.
	naves add: Ship create.
	"despues setear el agujero"
	aPositionY:=10.
	aPositionZ:=30.
	wormhole:= WormHole at:aPositionY and: aPositionZ.
	
	tablero := GameBoard setSquares: 10 setShips: naves setWormhole: wormhole.
	naveActual:= naves at:1.
	tablero move: naveActual with: 3.
	
	self assert: naveActual position equals: 3.
]

{ #category : 'tests' }
GameBoardTest >> testShipCanUseTheWormHoleYposition [
	| naves tablero naveActual aPositionY aPositionZ wormhole |
	naves := OrderedCollection new.
	naves add: Ship create.
	
	aPositionY:=10.
	aPositionZ:=30.
	wormhole:= WormHole at:aPositionY and: aPositionZ.
	
	tablero := GameBoard setSquares: 10 setShips: naves setWormhole: wormhole .
	naveActual:= naves at:1.
	tablero move: naveActual with: 10.
	
	self assert: naveActual position equals: 30.
]

{ #category : 'tests' }
GameBoardTest >> testShipCanUseTheWormHoleZposition [
	| naves tablero naveActual aPositionY aPositionZ wormhole |
	naves := OrderedCollection new.
	naves add: Ship create.
	
	aPositionY:=10.
	aPositionZ:=30.
	wormhole:= WormHole at:aPositionY and: aPositionZ.
	
	tablero := GameBoard setSquares: 10 setShips: naves setWormhole: wormhole .
	naveActual:= naves at:1.
	tablero move: naveActual with: 30.
	
	self assert: naveActual position equals: 10.
]
