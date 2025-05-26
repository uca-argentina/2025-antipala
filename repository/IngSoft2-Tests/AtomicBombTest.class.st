Class {
	#name : 'AtomicBombTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
AtomicBombTest >> testBanana [
]

{ #category : 'tests' }
AtomicBombTest >> testWhenTheShipEnterInAHyperJumpThenadvances [

	| gameboard  aCollectionOfEffects totalSquares ships atomicBomb |
	totalSquares := 100.
	ships := OrderedCollection new.
	ships add: (Ship create: 1).
	ships add: (Ship create: 2).
	ships add: (Ship create: 3).
	atomicBomb := AtomicBomb at: 10 and: ships.
	aCollectionOfEffects := OrderedCollection new.
	aCollectionOfEffects add: atomicBomb .
	gameboard := GameBoard
		             with: totalSquares
		             including: aCollectionOfEffects.

	gameboard move: (ships at: 1) with: 5.
	self assert: (ships at: 1) position equals: 5.

	gameboard move: (ships at: 2) with: 5.
	self assert: (ships at: 2) position equals: 5.

	gameboard move: (ships at: 3) with: 5.
	self assert: (ships at: 3) position equals: 5.

	gameboard move: (ships at: 1) with: 5.
	self assert: (ships at: 1) position equals: 0.
	self assert: (ships at: 2) position equals: 0.
	self assert: (ships at: 3) position equals: 0.
]
