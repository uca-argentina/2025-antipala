Class {
	#name : 'BoardBuilderTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
BoardBuilderTest >> testBanana [
	| dices ships gameboard boardbuilder |
	dices := OrderedCollection new.
	dices add: (Dice with: 6).
	ships := OrderedCollection new.
	ships add: (Ship create: 1).
	ships add: (Ship create: 2).
	ships add: (Ship create: 3).
	boardbuilder:= BoardBuilder with: 100 and: dices and: ships.
	gameboard:= boardbuilder generateEffectsForBoard .
	
	self assert: (gameboard isKindOf: GameBoard)
	
]

{ #category : 'tests' }
BoardBuilderTest >> testTheBoardBuilderReturnsAGameBoard [
	| dices ships gameboard boardbuilder |
	dices := OrderedCollection new.
	dices add: (Dice with: 6).
	ships := OrderedCollection new.
	ships add: (Ship create: 1).
	ships add: (Ship create: 2).
	ships add: (Ship create: 3).
	boardbuilder:= BoardBuilder with: 100 and: dices and: ships.
	gameboard:= boardbuilder generateEffectsForBoard .
	
	self assert: (gameboard isKindOf: GameBoard)
	
]
