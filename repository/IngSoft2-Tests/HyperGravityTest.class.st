Class {
	#name : 'HyperGravityTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'as yet unclassified' }
HyperGravityTest >> testWhenTheShipEnterInAHyperGravityThenadvances [

	| gameboard actualShip hypergravity aCollectionOfEffects totalSquares |
	totalSquares := 100.
	hypergravity := HyperGravity at: 5.
	aCollectionOfEffects := OrderedCollection new.
	aCollectionOfEffects add: hypergravity .
	gameboard := GameBoard
		             with: totalSquares
		             including: aCollectionOfEffects.
	actualShip := Ship create: 1.
	gameboard move: actualShip with: 5.
	self assert: actualShip position equals: 5 
	
]

{ #category : 'as yet unclassified' }
HyperGravityTest >> testWhenTheShipEntersMultipleTimesThenItAdvancesDiferentSquares [

	| gameboard actualShip hyperJump aCollectionOfEffects totalSquares |
	totalSquares := 20. "15% = 3, 10% = 2, 5% = 1"
	hyperJump := HyperJump at: 5 and: totalSquares.
	aCollectionOfEffects := OrderedCollection new.
	aCollectionOfEffects add: hyperJump.
	gameboard := GameBoard
		             with: totalSquares
		             including: aCollectionOfEffects.
	actualShip := Ship create: 1.

	gameboard move: actualShip with: 5.
	self assert: actualShip position equals: 8.

	gameboard move: actualShip with: 17.
	self assert: actualShip position equals: 7.

	gameboard move: actualShip with: 18.
	self assert: actualShip position equals: 6.
	
	gameboard move: actualShip with: 19.
	self assert: actualShip position equals: 8.
]
