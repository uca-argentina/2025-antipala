Class {
	#name : 'HiperGravityTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
HiperGravityTest >> testBanana [

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
	self assert: actualShip position equals: 5.
]
