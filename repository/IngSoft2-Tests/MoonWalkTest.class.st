Class {
	#name : 'MoonWalkTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
MoonWalkTest >> testWhenTheShipEnterInAMoonWalkThenTheOtherShipsRetroced [

	| gameboard  moonWalk aCollectionOfEffects totalSquares ships |
	totalSquares := 100.
	ships := OrderedCollection new.
	ships add: (Ship create: 1).
	ships add: (Ship create: 2).
	ships add: (Ship create: 3).
	moonWalk := MoonWalk at: 10 and: ships and: 2.
	aCollectionOfEffects := OrderedCollection new.
	aCollectionOfEffects add: moonWalk.
	gameboard := GameBoard
		             with: totalSquares
		             including: aCollectionOfEffects.
	
		
	gameboard move: (ships at: 1) with: 5.
	gameboard move: (ships at: 2) with: 5.
	gameboard move: (ships at: 3) with: 5.
	gameboard move: (ships at: 1) with: 5.
	
	self assert: (ships at: 1) position equals: 10.
	self assert: (ships at: 2) position equals: 3.
	self assert: (ships at: 3) position equals: 3
]
