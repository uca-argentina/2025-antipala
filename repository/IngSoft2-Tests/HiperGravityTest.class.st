Class {
	#name : 'HiperGravityTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
HiperGravityTest >> testTwoShipsEnteredInTheHyperGravityHoleOneExitAndTheOtherNot [
	| gameboard actualShip aCollectionOfEffects totalSquares hyperGravity actualShip2 |
	totalSquares := 100.
	hyperGravity := HyperGravity atPosition: 5 withValue: 9.
	aCollectionOfEffects := OrderedCollection new.
	aCollectionOfEffects add: hyperGravity .
	gameboard := GameBoard
		             with: totalSquares
		             including: aCollectionOfEffects.
	actualShip := Ship create: 1.
	actualShip2 := Ship create: 2.
	gameboard move: actualShip with: 5.
	gameboard move: actualShip2 with: 5.
	gameboard move: actualShip with: 10.
	gameboard move: actualShip with: 10.
	gameboard move: actualShip2 with: 6.

	self assert: actualShip position equals: 15.
	self assert: actualShip2 position equals: 5.
	



]

{ #category : 'tests' }
HiperGravityTest >> testWhenTheShipEnterInAHiperGravityHoleAndDontMoveFuelStaysTheSame [
	| gameboard actualShip aCollectionOfEffects totalSquares hyperGravity |
	totalSquares := 100.
	hyperGravity := HyperGravity atPosition: 5 withValue: 9.
	aCollectionOfEffects := OrderedCollection new.
	aCollectionOfEffects add: hyperGravity .
	gameboard := GameBoard
		             with: totalSquares
		             including: aCollectionOfEffects.
	actualShip := Ship create: 1.
	gameboard move: actualShip with: 5.
	gameboard move: actualShip with: 8.
	gameboard move: actualShip with: 7.
	self assert: actualShip fuel equals: 95.
]

{ #category : 'tests' }
HiperGravityTest >> testWhenTheShipEnterInAHyperGravityHoleAndPassTheConditionHeCanMove [
	| gameboard actualShip aCollectionOfEffects totalSquares hyperGravity |
	totalSquares := 100.
	hyperGravity := HyperGravity atPosition: 5 withValue: 9.
	aCollectionOfEffects := OrderedCollection new.
	aCollectionOfEffects add: hyperGravity .
	gameboard := GameBoard
		             with: totalSquares
		             including: aCollectionOfEffects.
	actualShip := Ship create: 1.
	gameboard move: actualShip with: 5.
	gameboard move: actualShip with: 10.
	gameboard move: actualShip with: 10.
	self assert: actualShip position equals: 15.
	self assert: actualShip fuel equals: 85.
]

{ #category : 'tests' }
HiperGravityTest >> testWhenTheShipEnterInAHyperGravityHoleHeCameOutInTheNextTurn [
	| gameboard actualShip aCollectionOfEffects totalSquares hyperGravity |
	totalSquares := 100.
	hyperGravity := HyperGravity atPosition: 5 withValue: 9.
	aCollectionOfEffects := OrderedCollection new.
	aCollectionOfEffects add: hyperGravity .
	gameboard := GameBoard
		             with: totalSquares
		             including: aCollectionOfEffects.
	actualShip := Ship create: 1.
	gameboard move: actualShip with: 5.
	gameboard move: actualShip with: 10.
	self assert: actualShip hyperGravityStatus equals: 0.
	
	
]

{ #category : 'tests' }
HiperGravityTest >> testWhenTheShipEnterInAHyperGravityHoleThenChangeHisHyperGravityStatus [

	| gameboard actualShip aCollectionOfEffects totalSquares hyperGravity |
	totalSquares := 100.
	hyperGravity := HyperGravity atPosition: 5 withValue: 9.
	aCollectionOfEffects := OrderedCollection new.
	aCollectionOfEffects add: hyperGravity .
	gameboard := GameBoard
		             with: totalSquares
		             including: aCollectionOfEffects.
	actualShip := Ship create: 1.
	gameboard move: actualShip with: 5.
	self assert: actualShip hyperGravityStatus equals: 1.
]

{ #category : 'tests' }
HiperGravityTest >> testWhenTheShipEnterInAHyperGravityHoleThenHeCannotMoveWithLowThrowDice [
	| gameboard actualShip aCollectionOfEffects totalSquares hyperGravity |
	totalSquares := 100.
	hyperGravity := HyperGravity atPosition: 5 withValue: 9.
	aCollectionOfEffects := OrderedCollection new.
	aCollectionOfEffects add: hyperGravity .
	gameboard := GameBoard
		             with: totalSquares
		             including: aCollectionOfEffects.
	actualShip := Ship create: 1.
	gameboard move: actualShip with: 5.
	gameboard move: actualShip with: 5.
	self assert: actualShip hyperGravityStatus equals: 1.
	self assert: actualShip position equals: 5.
]
