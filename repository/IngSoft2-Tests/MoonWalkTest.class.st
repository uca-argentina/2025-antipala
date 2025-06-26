Class {
	#name : 'MoonWalkTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'asserting' }
MoonWalkTest >> should: anErrorBlock raise: anErrorClass withMessageText: errorMessage [
	self
		should: anErrorBlock
		raise: anErrorClass
		withExceptionDo: [ :error |
			self assert: (error messageText) equals: errorMessage ].
]

{ #category : 'tests' }
MoonWalkTest >> testMoonWalkAffectsAllShipsExceptTheOneThatTriggersIt [

	|  game dices  tiles |
	tiles := OrderedCollection new.
	20 timesRepeat: [ tiles add: (NoEffect create)].
	tiles at: 11 put: (MoonWalk createWith: 3).
	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 5 )).

	game := Game createOn: tiles toPlayWith: dices withARequired: 3 andWithThePlayers: 3.
	game play.
	game play.
	game play.
	self assert: ((game ship: 1) isAt: 6).
	self assert: ((game ship: 2) isAt: 6).
	self assert: ((game ship: 3) isAt: 6).
	game play.

	self assert: ((game ship: 1) isAt: 11).
	self assert: ((game ship: 2) isAt: 3).
	self assert: ((game ship: 3) isAt: 3)
]

{ #category : 'tests' }
MoonWalkTest >> testMoonWalkCanNotBeCreatedWithAnInvalidWald [
	self
		should: [MoonWalk createWith: -2 ]
		raise: Error
		withMessageText: 'The MoonWalk value must be positive'.
]
