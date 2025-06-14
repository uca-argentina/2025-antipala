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

	| gameboard actualShip aPositionY aPositionZ wormhole aCollectionOfEffects anEffectManager |

	"despues setear el agujero"
	aPositionY:=10.
	aPositionZ:=30.
	wormhole:= WormHole at:aPositionY and: aPositionZ.
	aCollectionOfEffects:= OrderedCollection new.
	aCollectionOfEffects add: wormhole.
	anEffectManager := EffectManager createWith: aCollectionOfEffects .
	gameboard := GameBoard
		             with: 40
		             including: anEffectManager.
	actualShip:= Ship create:1.
	gameboard move: actualShip with: 3.
	
	self assert: actualShip position equals: 3.
]

{ #category : 'tests' }
GameBoardTest >> testGameBoardShouldThrowErrorWhenInitialiceSquaresWith1 [
| anEffectManager aCollectionOfEffects |
aCollectionOfEffects:= OrderedCollection new.

aCollectionOfEffects add: (WormHole at: 2 and: 3).
anEffectManager := EffectManager createWith: aCollectionOfEffects .

self
	should:[GameBoard with: 3 including: (anEffectManager) ]
	raise: Error
	withMessageText: 'The number of squares should be more than 3'.
]

{ #category : 'tests' }
GameBoardTest >> testShipCanSpendFuelAmountwithEffect [
	| gameboard actualShip aPositionY aPositionZ wormhole aCollectionOfEffects anEffectManager |
	
	aPositionY:=10.
	aPositionZ:=30.
	wormhole:= WormHole at:aPositionY and: aPositionZ.
	aCollectionOfEffects:= OrderedCollection new.
	aCollectionOfEffects add: wormhole.
	anEffectManager := EffectManager createWith: aCollectionOfEffects .
	gameboard := GameBoard
		             with: 40
		             including: anEffectManager.
	actualShip:= Ship create:1.
	gameboard move: actualShip with: 10.
	
	self assert: actualShip fuel equals: 70.
]

{ #category : 'tests' }
GameBoardTest >> testShipCanUseTheWormHoleYposition [
	| gameboard actualShip aPositionY aPositionZ wormhole aCollectionOfEffects anEffectManager |
	
	aPositionY:=10.
	aPositionZ:=30.
	wormhole:= WormHole at:aPositionY and: aPositionZ.
	aCollectionOfEffects:= OrderedCollection new.
	aCollectionOfEffects add: wormhole.
	anEffectManager := EffectManager createWith: aCollectionOfEffects .
	gameboard := GameBoard
		             with: 40
		             including: anEffectManager.
	actualShip:= Ship create:1.
	gameboard move: actualShip with: 10.
	
	self assert: actualShip position equals: 30.
]

{ #category : 'tests' }
GameBoardTest >> testShipCanUseTheWormHoleZposition [
	| gameboard actualShip aPositionY aPositionZ wormhole aCollectionOfEffects anEffectManager |
	
	aPositionY:=10.
	aPositionZ:=30.
	wormhole:= WormHole at:aPositionY and: aPositionZ.
	aCollectionOfEffects:= OrderedCollection new.
	aCollectionOfEffects add: wormhole.
	anEffectManager := EffectManager createWith: aCollectionOfEffects .
	gameboard := GameBoard
		             with: 40
		             including: anEffectManager.
	actualShip:= Ship create:1.
	gameboard move: actualShip with: 30.
	
	self assert: actualShip position equals: 10.
]

{ #category : 'tests' }
GameBoardTest >> testTheGameBoardCanBeInitializedWithACollectionOfEffects [

	| gameboard actualShip aPositionY aPositionZ wormhole aCollectionOfEffects anEffectManager |

	"despues setear el agujero"
	aPositionY:=10.
	aPositionZ:=30.
	wormhole:= WormHole at:aPositionY and: aPositionZ.
	aCollectionOfEffects:= OrderedCollection new.
	aCollectionOfEffects add: wormhole.
	anEffectManager := EffectManager createWith: aCollectionOfEffects .
	gameboard := GameBoard
		             with: 40
		             including: anEffectManager.
	actualShip:= Ship create:1.
	gameboard move: actualShip with: 3.
	
	self assert: actualShip position equals: 3.
]

{ #category : 'tests' }
GameBoardTest >> testTheShipsUseTheCircularBoard [

	| gameboard actualShip aPositionY aPositionZ wormhole aDice aCollectionOfEffects anEffectManager |
	aPositionY := 2.
	aPositionZ := 4.
	wormhole := WormHole at: aPositionY and: aPositionZ.
	aDice := ChargeDice new.
	aCollectionOfEffects := OrderedCollection new.
	aCollectionOfEffects add: wormhole.
	anEffectManager := EffectManager createWith: aCollectionOfEffects .
	gameboard := GameBoard
		             with: 4
		             including: anEffectManager.
	actualShip := Ship create: 1.

	self assert: actualShip position equals: 0.
	self assert: actualShip laps equals: 0.

	gameboard move: actualShip with: aDice roll.

	self assert: actualShip position equals: 1.
	self assert: actualShip laps equals: 1
]
