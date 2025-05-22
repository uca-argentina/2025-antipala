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
	| gameboard actualShip aPositionY aPositionZ wormhole |

	"despues setear el agujero"
	aPositionY:=10.
	aPositionZ:=30.
	wormhole:= WormHole at:aPositionY and: aPositionZ.
	
	gameboard := GameBoard with: 40 and: wormhole.
	actualShip:= Ship create:1.
	gameboard move: actualShip with: 3.
	
	self assert: actualShip position equals: 3.
]

{ #category : 'tests' }
GameBoardTest >> testGameBoardShouldThrowErrorWhenInitialiceSquaresWith1 [
self
	should:[GameBoard with: 3 and:[ WormHole at: 2 and: 3]]
	raise: Error
	withMessageText: 'The number of squares should be more than 3'.
]

{ #category : 'tests' }
GameBoardTest >> testShipCanSpendFuelAmountwithEffect [
	| gameboard actualShip aPositionY aPositionZ wormhole |
	
	aPositionY:=10.
	aPositionZ:=30.
	wormhole:= WormHole at:aPositionY and: aPositionZ.
	
	gameboard := GameBoard with: 10 and: wormhole .
	actualShip:= Ship create:1.
	gameboard move: actualShip with: 10.
	
	self assert: actualShip fuel equals: 70.
]

{ #category : 'tests' }
GameBoardTest >> testShipCanUseTheWormHoleYposition [
	| gameboard actualShip aPositionY aPositionZ wormhole |
	
	aPositionY:=10.
	aPositionZ:=30.
	wormhole:= WormHole at:aPositionY and: aPositionZ.
	
	gameboard := GameBoard with: 10 and: wormhole .
	actualShip:= Ship create:1.
	gameboard move: actualShip with: 10.
	
	self assert: actualShip position equals: 30.
]

{ #category : 'tests' }
GameBoardTest >> testShipCanUseTheWormHoleZposition [
	| gameboard actualShip aPositionY aPositionZ wormhole |
	
	aPositionY:=10.
	aPositionZ:=30.
	wormhole:= WormHole at:aPositionY and: aPositionZ.
	
	gameboard := GameBoard with: 10 and: wormhole .
	actualShip:= Ship create:1.
	gameboard move: actualShip with: 30.
	
	self assert: actualShip position equals: 10.
]
