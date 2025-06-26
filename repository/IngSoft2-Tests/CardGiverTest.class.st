Class {
	#name : 'CardGiverTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
CardGiverTest >> testCardGiverCanGiveACardToThePlayer [
	| game dices tiles cardGiver chargeDice card |
	tiles := OrderedCollection new.
	chargeDice:= ChargeDice createWith: #( 4 ).
	cardGiver := CardGiver createWith: chargeDice.
	
	20 timesRepeat: [ tiles add: (NoEffect create)].
	tiles at: 5 put: (cardGiver).
	dices := OrderedCollection new.
	dices add: chargeDice.

	game := Game createOn: tiles toPlayWith: dices withARequired: 3 andWithThePlayers: 1.
	self assert: ((game ship: 1) isAt: 1).

	game play.
	self assert: ((game ship: 1) isAt: 5).
	card :=cardGiver lastCardGived.
	self assert: card class equals: OverLoad .
	self shouldnt: ((game ship: 1) removeCard: card) raise: Error.
]

{ #category : 'tests' }
CardGiverTest >> testCardGiverCanGiveAllTypesOfCards [
	| game dices tiles cardGiver chargeDice card |
	tiles := OrderedCollection new.
	chargeDice:= ChargeDice createWith: #( 1 2 3 4 5).
	cardGiver := CardGiver createWith: chargeDice.
	
	5 timesRepeat: [ tiles add: (NoEffect create)].
	tiles at: 4 put: (cardGiver).
	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #(3)).

	game := Game createOn: tiles toPlayWith: dices withARequired: 3 andWithThePlayers: 5.
	game play.
	card :=cardGiver lastCardGived.
	self assert: card class equals: Acceleration .
	self shouldnt: ((game ship: 1) removeCard: card) raise: Error.
	
	game play.
	card :=cardGiver lastCardGived.
	self assert: card class equals: Ally .
	self shouldnt: ((game ship: 2) removeCard: card) raise: Error.
	
	game play.
	card :=cardGiver lastCardGived.
	self assert: card class equals: Cancelation .
	self shouldnt: ((game ship: 3) removeCard: card) raise: Error.
	
	game play.
	card :=cardGiver lastCardGived.
	self assert: card class equals: OverLoad .
	self shouldnt: ((game ship: 4) removeCard: card) raise: Error.
	
	game play.
	card :=cardGiver lastCardGived.
	self assert: card class equals: Redo .
	self shouldnt: ((game ship: 5) removeCard: card) raise: Error.
	

]
