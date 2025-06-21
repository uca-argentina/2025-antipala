Class {
	#name : 'MoonWalkTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'as yet unclassified' }
MoonWalkTest >> testWhenTheShipEnterInAMoonWalkThenTheOtherShipsRetroced [

	| gameboard  moonWalk aCollectionOfEffects totalSquares ships anEffectManager |
	totalSquares := 100.
	ships := OrderedCollection new.
	ships add: (Ship create: 1).
	ships add: (Ship create: 2).
	ships add: (Ship create: 3).
	moonWalk := MoonWalk at: 10 and: ships and: 2 and: 100.
	aCollectionOfEffects := OrderedCollection new.
	aCollectionOfEffects add: moonWalk.
	anEffectManager := EffectManager createWith: aCollectionOfEffects .
	gameboard := GameBoard
		             with: totalSquares 
		             including: anEffectManager.
	
		
	gameboard move: (ships at: 1) with: 5.
	gameboard move: (ships at: 2) with: 5.
	gameboard move: (ships at: 3) with: 5.
	gameboard move: (ships at: 1) with: 5.
	
	
	self assert: ((ships at: 1) isAt: 10).
	self assert: ((ships at: 2) isAt: 3).
	self assert: ((ships at: 3) isAt: 3)
]
