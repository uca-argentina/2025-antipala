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
	| gameboard  aPositionY aPositionZ wormhole aDice result|

	"despues setear el agujero" 
	aPositionY:=10.
	aPositionZ:=30.
	wormhole:= WormHole at:aPositionY and: aPositionZ.
	aDice:=ChargeDice new.
	gameboard := GameBoard with: 40 and: wormhole and: 1.
	result:=aDice roll.
	gameboard moveShipWithId:1 by:result.
	
	self assert: (gameboard positionOf:1) equals: 5.
]

{ #category : 'tests' }
GameBoardTest >> testGameBoardShouldThrowErrorWhenInitialiceSquaresWith1 [
self
	should:[GameBoard with: 3 and:[ WormHole at: 2 and: 3] and:1]
	raise: Error
	withMessageText: 'The number of squares should be more than 3'.
]

{ #category : 'tests' }
GameBoardTest >> testGameboardCanKnowPositionsOfMovedShips [

	| gameboard  aPositionY aPositionZ wormhole |
	aPositionY := 10.
	aPositionZ := 35.
	wormhole := WormHole at: aPositionY and: aPositionZ.

	gameboard := GameBoard with: 10 and: wormhole and: 1.
	
	gameboard moveShipWithId:1 by:30.

	self assert: (gameboard positionOf: 1) equals: 30.
]

{ #category : 'tests' }
GameBoardTest >> testGameboardCanKnowPositionsOfShips [

	| gameboard  aPositionY aPositionZ wormhole |
	aPositionY := 10.
	aPositionZ := 30.
	wormhole := WormHole at: aPositionY and: aPositionZ.

	gameboard := GameBoard with: 10 and: wormhole and: 1.
	
	"gameboard move: actualShip with: 30."

	self assert: (gameboard positionOf: 1) equals: 0.
]

{ #category : 'tests' }
GameBoardTest >> testShipCanUseTheWormHoleYposition [
	| gameboard  aPositionY aPositionZ wormhole aDice result|

	"despues setear el agujero" 
	aPositionY:=10.
	aPositionZ:=30.
	wormhole:= WormHole at:aPositionY and: aPositionZ.
	aDice:=ChargeDice new.
	gameboard := GameBoard with: 40 and: wormhole and: 1.
	result:=aDice roll. "turno 1 "
	gameboard moveShipWithId:1 by:result.
	result:=aDice roll. "turno 2 "
	gameboard moveShipWithId:1 by:result.
	self assert: (gameboard positionOf:1) equals: 30.
]

{ #category : 'tests' }
GameBoardTest >> testShipCanUseTheWormHoleZposition [
	| gameboard  aPositionY aPositionZ wormhole aDice result|

	"despues setear el agujero" 
	aPositionY:=4.
	aPositionZ:=5.
	wormhole:= WormHole at:aPositionY and: aPositionZ.
	aDice:=ChargeDice new.
	gameboard := GameBoard with: 40 and: wormhole and: 1.
	result:=aDice roll. "turno 1 "
	gameboard moveShipWithId:1 by:result.
	self assert: (gameboard positionOf:1) equals: 4.
]
