Class {
	#name : 'RedoTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'as yet unclassified' }
RedoTest >> testcandredoacard [
	| dices builder ship1 ship2 ship3 ship4 cardManager moveManager aAlly aRedo|
	dices:= OrderedCollection new.
	dices add: (ChargeDice createWith: #( 5 )).
	builder := ShipBuilder buildWith: dices.
	ship1 := builder build.
	ship2 := builder build.
	ship3 := builder build.
	ship4 := builder build.
	aAlly:=Ally create.
   aRedo:=Redo new.	
	cardManager :=CardManager create.
	cardManager apply: aAlly from: ship1 to: ship2.
	moveManager := MoveManager createWith: 20 and: (cardManager ).
	moveManager move: ship1 by: 15.
	self assert: (ship1 isAt: 16).
	cardManager apply: aRedo from: ship3 to: ship4.
	moveManager := MoveManager createWith: 20 and: (cardManager ).
	moveManager move: ship3 by: 15.
	self assert: (ship3 isAt: 16)
]

{ #category : 'as yet unclassified' }
RedoTest >> testcandredoacardanddoesntchainredo [
	| dices builder ship1 ship2 ship3 ship4 ship5 ship6 cardManager moveManager aAlly aRedo|
	dices:= OrderedCollection new.
	dices add: (ChargeDice createWith: #( 5 )).
	builder := ShipBuilder buildWith: dices.
	ship1 := builder build.
	ship2 := builder build.
	ship3 := builder build.
	ship4 := builder build.
	ship5 := builder build.
	ship6 := builder build.
	aAlly:=Ally create.
   aRedo:=Redo new.	
	cardManager :=CardManager create.
	cardManager apply: aAlly from: ship1 to: ship2.
	moveManager := MoveManager createWith: 20 and: (cardManager ).
	moveManager move: ship1 by: 15.
	self assert: (ship1 isAt: 16).
	cardManager apply: aRedo from: ship3 to: ship4.
	moveManager := MoveManager createWith: 20 and: (cardManager ).
	moveManager move: ship3 by: 15.
	self assert: (ship3 isAt: 16).
	cardManager apply: aRedo from: ship5 to: ship6.
	moveManager := MoveManager createWith: 20 and: (cardManager ).
	moveManager move: ship5 by: 15.
	self assert: (ship5 isAt: 16)
	
]
