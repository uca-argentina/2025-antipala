Class {
	#name : 'BlackHoleTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
BlackHoleTest >> testWhenTheShipEnterInABlackHoleThenGoBack4Squares [
	| gameboard actualShip aPositionY aPositionZ wormhole aCollectionOfEffects blackhole |

	"despues setear el agujero"
	aPositionY:=10.
	aPositionZ:=30.
	wormhole:= WormHole at:aPositionY and: aPositionZ.
	blackhole:= BlackHole at: 5.
	aCollectionOfEffects:= OrderedCollection new.
	aCollectionOfEffects add: wormhole.
	aCollectionOfEffects add: blackhole.
	gameboard := GameBoard with: 40 including: aCollectionOfEffects.
	actualShip:= Ship create:1.
	gameboard move: actualShip with: 5.
	
	self assert: actualShip position equals: 1.
]
