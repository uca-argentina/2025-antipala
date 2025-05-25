Class {
	#name : 'HyperGravityTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
HyperGravityTest >> testWhenTheShipEnterInHyperGravity [
	"despues setear el agujero"

	| hypergravity aCollectionOfEffects gameboard actualShip |
	hypergravity:= HyperGravity at: 5 withXValue: 8.
	aCollectionOfEffects:= OrderedCollection new.
	aCollectionOfEffects add: hypergravity.
	gameboard := GameBoard with: 40 including: aCollectionOfEffects.
	actualShip:= Ship create:1.
	gameboard move: actualShip with: 5.
	
	self assert: actualShip position equals: 1.
]
