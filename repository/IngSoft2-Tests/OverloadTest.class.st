Class {
	#name : 'OverloadTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'as yet unclassified' }
OverloadTest >> testOverloadCardShoulDecreaseTheMovementOfAShip [

	| dices builder ship1 ship2 cardManager moveManager card |
	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 5 )).
	builder := ShipBuilder buildWith: dices.
	ship1 := builder build.
	ship2 := builder build.

	cardManager := CardManager create .
	
	card := Acceleration create.
	cardManager apply: card from: ship1 to: ship2.
	self assert: (cardManager throwEffectsFor: ship1) equals: 1.

	cardManager apply: card from: ship2 to: ship1.
	self assert: (cardManager throwEffectsFor: ship1) equals: 2.

	moveManager := MoveManager createWith: 20 and: cardManager .

	moveManager move: ship1 by: 5.
	self assert: (ship1 isAt: 8).
	
	moveManager move: ship2 by: 1.
	self assert: (ship2 isAt: 4).
]
