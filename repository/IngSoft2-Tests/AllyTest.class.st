Class {
	#name : 'AllyTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
AllyTest >> testAShipCanUseTheFuelOfTheAlly [

	| dices builder ship1 ship2 cardManager moveManager aAlly|
	dices:= OrderedCollection new.
	dices add: (ChargeDice createWith: #( 5 )).
	builder := ShipBuilder buildWith: dices.
	ship1 := builder build.
	ship2 := builder build.
	aAlly:=Ally create.
	cardManager :=CardManager createWith: #(  ).
	cardManager apply: aAlly from: ship1 to: ship2.
	moveManager := MoveManager createWith: 20 and: (cardManager ).
	moveManager move: ship1 by: 15.
	self assert: (ship1 isAt: 16)
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
	cardManager :=CardManager createWith: #(  ).
	cardManager apply: aAlly from: ship1 to: ship2.
	moveManager := MoveManager createWith: 20 and: (cardManager ).
	moveManager move: ship1 by: 15.
	self assert: (ship1 isAt: 16).
	moveManager move: ship3 by: 15.
	self assert: (ship1 isAt: 1)
]
