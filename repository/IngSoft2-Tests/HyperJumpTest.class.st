Class {
	#name : 'HyperJumpTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'as yet unclassified' }
HyperJumpTest >> testWhenTheShipEnterInAHyperJumpThenadvances [

	| gameboard actualShip hyperJump aCollectionOfEffects totalSquares anEffectManager |
	totalSquares := 100.
	hyperJump := HyperJump at: 5 and: totalSquares.
	aCollectionOfEffects := OrderedCollection new.
	aCollectionOfEffects add: hyperJump .
	anEffectManager := EffectManager createWith: aCollectionOfEffects .
	gameboard := GameBoard
		             with: totalSquares 
		             including: anEffectManager.
	actualShip := Ship create: 1.
	gameboard move: actualShip with: 5.

	self assert: actualShip position equals: 20 "5 (throw) + 15 (15% of 100)"
	
]

{ #category : 'as yet unclassified' }
HyperJumpTest >> testWhenTheShipEntersMultipleTimesThenItAdvancesDiferentSquares [

	| gameboard actualShip hyperJump aCollectionOfEffects totalSquares anEffectManager |
	totalSquares := 20. "15% = 3, 10% = 2, 5% = 1"
	hyperJump := HyperJump at: 5 and: totalSquares.
	aCollectionOfEffects := OrderedCollection new.
	aCollectionOfEffects add: hyperJump.
	anEffectManager := EffectManager createWith: aCollectionOfEffects .
	gameboard := GameBoard
		             with: totalSquares 
		             including: anEffectManager.
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
