Class {
	#name : 'AllyTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
AllyTest >> testAShipCanBeAllyOfMultipleShips [

	| dices builder ship1 ship2 cardManager moveManager ship3 allyCard1 allyCard2 |
	dices:= OrderedCollection new.
	dices add: (ChargeDice createWith: #( 5 )).
	builder := ShipBuilder buildWith: dices.
	ship1 := builder build.
	ship2 := builder build.
	ship3 := builder build.
	allyCard1 :=Ally create.
	allyCard2 :=Ally create.
	ship1 addCard: allyCard1.
	ship1 addCard: allyCard2.
	cardManager :=CardManager create.
	cardManager apply: allyCard1 from: ship1 to: ship2.
	cardManager apply: allyCard2 from: ship1 to: ship3.
	moveManager := MoveManager createWith: 30 and: (cardManager ).
	moveManager move: ship1 by: 25.
	self assert: (ship1 isAt: 26)."
	moveManager move: ship3 by: 15.
	self assert: (ship3 isAt: 1)"
]

{ #category : 'tests' }
AllyTest >> testAShipCanUseTheFuelOfTheAlly [

	| dices builder ship1 ship2 cardManager moveManager aAlly|
	dices:= OrderedCollection new.
	dices add: (ChargeDice createWith: #( 5 )).
	builder := ShipBuilder buildWith: dices.
	ship1 := builder build.
	ship2 := builder build.
	aAlly:=Ally create.
	ship1 addCard: aAlly.
	cardManager :=CardManager create.
	cardManager apply: aAlly from: ship1 to: ship2.
	moveManager := MoveManager createWith: 20 and: (cardManager ).
	moveManager move: ship1 by: 15.
	self assert: (ship1 isAt: 16)
]

{ #category : 'tests' }
AllyTest >> testAShipCantAlly3Ships [

	| dices builder ship1 ship2 cardManager moveManager ship3 allyCard1 allyCard2 |
	dices:= OrderedCollection new.
	dices add: (ChargeDice createWith: #( 5 )).
	builder := ShipBuilder buildWith: dices.
	ship1 := builder build.
	ship2 := builder build.
	ship3 := builder build.
	allyCard1 :=Ally create.
	allyCard2 :=Ally create.
	ship1 addCard: allyCard1.
	ship1 addCard: allyCard2.
	cardManager :=CardManager create.
	cardManager apply: allyCard1 from: ship1 to: ship2.
	cardManager apply: allyCard2 from: ship1 to: ship3.
	moveManager := MoveManager createWith: 30 and: (cardManager ).
	moveManager move: ship1 by: 25.
	self assert: (ship1 isAt: 26).
	moveManager move: ship3 by: 15.
	self assert: (ship3 isAt: 1).
]

{ #category : 'tests' }
AllyTest >> testAShipCantUseTheFuelOfTheAlly [

	| dices builder ship1 ship2 cardManager moveManager aAlly ship3|
	dices:= OrderedCollection new.
	dices add: (ChargeDice createWith: #( 5 )).
	builder := ShipBuilder buildWith: dices.
	ship1 := builder build.
	ship2 := builder build.
	ship3 := builder build.
	aAlly:=Ally create.
	ship1 addCard: aAlly .
	cardManager :=CardManager create.
	cardManager apply: aAlly from: ship1 to: ship2.
	moveManager := MoveManager createWith: 20 and: (cardManager ).
	moveManager move: ship1 by: 15.
	self assert: (ship1 isAt: 16).
	moveManager move: ship3 by: 15.
	self assert: (ship3 isAt: 1)
]
