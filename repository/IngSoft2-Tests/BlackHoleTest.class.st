Class {
	#name : 'BlackHoleTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
BlackHoleTest >> testWhenTheShipEnterInABlackHoleThenGoBack4Squares [
	| gameboard actualShip aCollectionOfEffects blackhole anEffectManager |

	blackhole:= BlackHole at: 5.
	aCollectionOfEffects:= OrderedCollection new.
	aCollectionOfEffects add: blackhole.
	anEffectManager := EffectManager createWith: aCollectionOfEffects .
	gameboard := GameBoard
		             with: 40
		             including: anEffectManager.
	actualShip:= Ship create:1.
	gameboard move: actualShip with: 5.
	
	self assert: (actualShip isInPosition: 1).
]
