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
	chargeDice:= ChargeDice createWith: #( 3 ).
	cardGiver := CardGiver createWith: chargeDice.
	
	20 timesRepeat: [ tiles add: (NoEffect create)].
	tiles at: 4 put: (cardGiver).
	dices := OrderedCollection new.
	dices add: chargeDice.

	game := Game createOn: tiles toPlayWith: dices withARequired: 3 andWithThePlayers: 1.
	self assert: ((game ship: 1) isAt: 1).

	game play.
	self assert: ((game ship: 1) isAt: 4).
	card :=cardGiver lastCardGived.
	self assert: card class equals: OverLoad .
	self shouldnt: ((game ship: 1) removeCard: card) raise: Error.
]

{ #category : 'tests' }
CardGiverTest >> testCardGiverCanGiveAllTypesOfCards [
	| game dices tiles cardGiver chargeDice card |
	tiles := OrderedCollection new.
	chargeDice:= ChargeDice createWith: #( 1 2 3 ).
	cardGiver := CardGiver createWith: chargeDice.
	
	5 timesRepeat: [ tiles add: (NoEffect create)].
	tiles at: 4 put: (cardGiver).
	dices := OrderedCollection new.
	dices add: chargeDice.

	game := Game createOn: tiles toPlayWith: dices withARequired: 3 andWithThePlayers: 1.
	self assert: ((game ship: 1) isAt: 1).

	game play.
	self assert: ((game ship: 1) isAt: 4).
	card :=cardGiver lastCardGived.
	self assert: card class equals: OverLoad .
	self shouldnt: ((game ship: 1) removeCard: card) raise: Error.
]
