Class {
	#name : 'AllyTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
AllyTest >> testAShipCanUseTheFuelOfTheAlly [

	| dices builder ship1 ship2 cardManager moveManager |
	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 5 )).
	builder := ShipBuilder buildWith: dices.
	ship1 := builder build.
	ship2 := builder build.

	cardManager := CardManager new.
	cardManager apply: Ally new from: ship1 to: ship2.
	moveManager := MoveManager createWith: (LapManager createWith: 20)
		               and: (CardManager createWith: #(  ))..

	moveManager move: ship1 by: 10.
	self assert: (ship1 isAt: 10)
]
