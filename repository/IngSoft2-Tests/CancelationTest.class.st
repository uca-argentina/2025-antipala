Class {
	#name : 'CancelationTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'asserting' }
CancelationTest >> should: anErrorBlock raise: anErrorClass withMessageText: errorMessage [

self
	should: anErrorBlock
	raise: anErrorClass
	withExceptionDo: [ :error | self assert: (error messageText)
			equals: errorMessage ]. 
]

{ #category : 'as yet unclassified' }
CancelationTest >> testcancelation [
	| dices builder ship1 ship2 cardManager card cardCancel|
	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 5 )).
	builder := ShipBuilder buildWith: dices.
	ship1 := builder build.
	ship2 := builder build.
	cardManager := CardManager create .

	card := Acceleration create.
	cardCancel := Cancelation create.
	ship1 addCard: card.
	cardManager apply: card from: ship1 to: ship2.
	self assert: (cardManager throwEffectsFor: ship1) equals: 1.
	ship2 addCard: cardCancel .
	cardManager apply: cardCancel from: ship2 to: card.
	self assert: (cardManager throwEffectsFor: ship1) equals: 0.

]

{ #category : 'as yet unclassified' }
CancelationTest >> testcancelationdoesnthavecard [
	| dices builder ship1 ship2 cardManager card cardCancel|
	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 5 )).
	builder := ShipBuilder buildWith: dices.
	ship1 := builder build.
	ship2 := builder build.
	cardManager := CardManager create .

	card := Acceleration create.
	cardCancel := Cancelation create.
	ship1 addCard: card.
	ship2 addCard: cardCancel .
	cardManager apply: card from: ship1 to: ship2.
	self assert: (cardManager throwEffectsFor: ship1) equals: 1.

	cardManager apply: cardCancel from: ship2 to: card.
	self assert: (cardManager throwEffectsFor: ship1) equals: 0.
	self should: [ cardManager apply: cardCancel from: ship2 to: card. ]
		raise: Error
		withMessageText: 'The Ship Should have the card to play'.
	

]
