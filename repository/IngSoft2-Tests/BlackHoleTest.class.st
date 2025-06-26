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

{ #category : 'tests' }
BlackHoleTest >> testBlackHolePositionCannotBeNegative [
	self
		should: [ BlackHole new initializeWith: -5 ]
		raise: Error
		withMessageText: 'Black Hole position must be positive'
]

{ #category : 'as yet unclassified' }
BlackHoleTest >> testWhenTheShipEnterInABlackHoleThenGoBack4Squares [

	| game dices tiles |
	tiles := OrderedCollection new.
	20 timesRepeat: [ tiles add: (NoEffect create)].
	tiles at: 5 put: (AtomicBomb create).
	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 4 )).

	game := Game createOn: tiles toPlayWith: dices withARequired: 3 andWithThePlayers: 1.

	game play.
	self assert: ((game ship:1) isAt: 1)
]
