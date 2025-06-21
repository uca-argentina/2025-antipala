Class {
	#name : 'BlackHoleTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
BlackHoleTest >> testWhenTheShipEnterInABlackHoleThenGoBack4Squares [
	| ship manager alapmanager blackhole|
	alapmanager:=Lapmanager createWith:20.
	ship := Ship2 createWhithId:1 andWithFuel:10 andwithlapmanager:alapmanager.
	blackhole:= BlackHole at: 5.
	manager := MoveManager create.
	manager move: ship by: 5.
	blackhole applyEffectTo: ship.
	self assert: (ship isInPosition: 1).
]
