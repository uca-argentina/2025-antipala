Class {
	#name : 'AccelerationTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'as yet unclassified' }
AccelerationTest >> testBanana [

	| dices builder ship1 ship2 cardManager moveManager |
	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 5 )).
	builder := ShipBuilder buildWith: dices.
	ship1 := builder build.
	ship2 := builder build.

	cardManager := CardManager new.
	cardManager apply: Acceleration new from: ship1 to: ship2.
	self assert: (cardManager throwEffectsFor: ship1) equals: 1.

	cardManager apply: Acceleration from: ship2 to: ship1.
	self assert: (cardManager throwEffectsFor: ship1) equals: 2.

	moveManager := MoveManager createWith: (LapManager createWith: 20).

	moveManager move: ship1 by: 5.
	self assert: (ship1 isAt: 6)
]
