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

	| effectlist game dices anMoonWalk |

	effectlist := OrderedCollection new.
	anMoonWalk := MoonWalk at: 10 and: 3.
	effectlist add: anMoonWalk.

	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 5 )).

	game := Game
		        createWith: 20
		        and: dices
		        and: effectlist
		        and: 3.
	game addShip.
	game addShip.
	game addShip.
	game play.
	game play.
	game play.
	self assert: ((game ship: 1) isAt: 5).
	self assert: ((game ship: 2) isAt: 5).
	self assert: ((game ship: 3) isAt: 5).
	game play.

	self assert: ((game ship: 1) isAt: 10).
	self assert: ((game ship: 2) isAt: 2).
	self assert: ((game ship: 3) isAt: 2)
]

{ #category : 'tests' }
MoonWalkTest >> testMoonWalkPositionCannotBeNegative [
	self
		should: [ MoonWalk new initializeWith: -4 and: 5 ]
		raise: Error
		withMessageText: 'The MoonWalk position must be positive'.
]

{ #category : 'tests' }
MoonWalkTest >> testMoonWalkwalkCannotBeNegative [
	self
		should: [ MoonWalk new initializeWith: 10 and: -5 ]
		raise: Error
		withMessageText: 'The MoonWalk walk must be positive'.
]
