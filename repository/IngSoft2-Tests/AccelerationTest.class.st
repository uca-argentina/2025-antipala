Class {
	#name : 'AccelerationTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'as yet unclassified' }
AccelerationTest >> testAccelerationCardShoulIncreaseTheMovementOfAllShips [

	| dices builder ship1 ship2 cardManager moveManager card card1 card2 |
	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 5 )).
	builder := ShipBuilder buildWith: dices.
	ship1 := builder build.
	ship2 := builder build.

	cardManager := CardManager create .
	
	card1 := Acceleration create.
	card2 := Acceleration create.
	ship1 addCard: card1.
	ship2 addCard: card2.
	cardManager apply: card1 from: ship1 to: ship2.
	self assert: (cardManager throwEffectsFor: ship1) equals: 1.

	cardManager apply: card2 from: ship2 to: ship1.
	self assert: (cardManager throwEffectsFor: ship1) equals: 2.

	moveManager := MoveManager createWith: 20 and: cardManager .

	moveManager move: ship1 by: 5.
	self assert: (ship1 isAt: 8).
	
	moveManager move: ship2 by: 1.
	self assert: (ship2 isAt: 4).
]
