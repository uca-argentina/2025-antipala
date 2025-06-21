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

	self assert: (actualShip isAt: 20) "5 (throw) + 15 (15% of 100)"
	
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
	self assert: (actualShip isAt: 8).
	
	actualShip := Ship create: 2.
	gameboard move: actualShip with: 5.
	self assert: (actualShip isAt: 7).
	
	actualShip := Ship create: 3.
	gameboard move: actualShip with: 5.
	self assert: (actualShip isAt: 6).
	
	actualShip := Ship create: 4.
	gameboard move: actualShip with: 5.
	self assert: (actualShip isAt: 8).
]
