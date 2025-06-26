Class {
	#name : 'OverloadTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'as yet unclassified' }
OverloadTest >> testOverloadCardSholdBeStackable [

	| dices builder ship1 ship2 cardManager moveManager  card1 card2 |
	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 5 )).
	builder := ShipBuilder buildWith: dices.
	ship1 := builder build.
	ship2 := builder build.
	
	cardManager := CardManager create .
	
	card1 := OverLoad create.
	card2 := OverLoad create.
	ship1 addCard: card1.
	ship1 addCard: card2.
	cardManager apply: card1 from: ship1 to: ship2.
	cardManager apply: card2 from: ship1 to: ship2.
	self assert: (cardManager throwEffectsFor: ship2) equals: -4.

	moveManager := MoveManager createWith: 20 and: cardManager .

	moveManager move: ship2 by: 5.
	self assert: (ship2 isAt:2).
]

{ #category : 'as yet unclassified' }
OverloadTest >> testOverloadCardShoulDecreaseTheMovementOfAShip [

	| dices builder ship1 ship2 cardManager moveManager card ship3 |
	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 5 )).
	builder := ShipBuilder buildWith: dices.
	ship1 := builder build.
	ship2 := builder build.
	ship3 := builder build.
	
	cardManager := CardManager create .
	
	card := OverLoad create.
	ship1 addCard: card.
	cardManager apply: card from: ship1 to: ship2.
	self assert: (cardManager throwEffectsFor: ship2) equals: -2.

	moveManager := MoveManager createWith: 20 and: cardManager .

	moveManager move: ship1 by: 5.
	self assert: (ship1 isAt: 6).
	
	moveManager move: ship2 by: 5.
	self assert: (ship2 isAt:4).
	
	moveManager move: ship3 by: 5.
	self assert: (ship3 isAt:6).
]
