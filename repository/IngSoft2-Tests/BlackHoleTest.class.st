Class {
	#name : 'BlackHoleTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'asserting' }
BlackHoleTest >> should: anErrorBlock raise: anErrorClass withMessageText: errorMessage [
	self
		should: anErrorBlock
		raise: anErrorClass
		withExceptionDo: [ :error |
			self assert: (error messageText) equals: errorMessage ].
]

{ #category : 'as yet unclassified' }
BlackHoleTest >> testBlackHoleMovesTheShipBack4SquaresEvenWithAnAccelerationInPlay [

	| cardManager moveManager effectsManager ship1 ship2 acceleration |
	cardManager := CardManager create.
	moveManager := MoveManager createWith: 20 and: cardManager.
	effectsManager := EffectsManager createWith: OrderedCollection new and: moveManager.
	ship1 := Ship createWhithId: 1 andWithFuel: 100.
	ship2 := Ship createWhithId: 2 andWithFuel: 100.
	acceleration := Acceleration create.
	ship1 addCard: acceleration.
	cardManager apply: acceleration from: ship1 to: ship2.
	moveManager move: ship2 byThrow: 10.
	BlackHole create applyEffectTo: ship2 with: effectsManager.
	self assert: (ship2 isAt: 8)
]

{ #category : 'as yet unclassified' }
BlackHoleTest >> testWhenTheShipEnterInABlackHoleThenGoBack4Squares [

	| game dices tiles |
	tiles := OrderedCollection new.
	20 timesRepeat: [ tiles add: (NoEffect create)].
	tiles at: 5 put: (BlackHole create).
	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 4 )).

	game := Game createOn: tiles toPlayWith: dices withARequired: 3 andWithThePlayers: 1.

	game play.
	self assert: ((game ship:1) isAt: 1)
]
