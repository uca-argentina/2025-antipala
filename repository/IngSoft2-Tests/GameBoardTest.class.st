Class {
	#name : 'GameBoardTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
GameBoardTest >> testGameBoardCanMoveAShip [
	| naves tablero naveActual |
	naves := OrderedCollection new.
	naves add: Ship create.
	"despues setear el agujero"
	tablero := GameBoard setSquares: 10 setShips: naves.
	naveActual:= naves at:1.
	tablero move: naveActual with: 3.
	
	self assert: naveActual position equals: 3.
]
