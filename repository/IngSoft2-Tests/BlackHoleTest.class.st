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

	| effectlist dices game |
	effectlist := OrderedCollection new.
	effectlist add: (BlackHole at: 5).

	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 5 )).

	game := Game
		        createWith: 20
		        and: dices
		        and: effectlist
		        and: 3.
	game addShip.

	game play.
	self assert: ((game ship:1) isAt: 1)
]
