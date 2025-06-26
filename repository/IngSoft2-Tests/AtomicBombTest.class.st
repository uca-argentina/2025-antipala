Class {
	#name : 'AtomicBombTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'asserting' }
AtomicBombTest >> should: anErrorBlock raise: anErrorClass withMessageText: errorMessage [
	self
		should: anErrorBlock
		raise: anErrorClass
		withExceptionDo: [ :error |
			self assert: (error messageText) equals: errorMessage ].
]

{ #category : 'tests' }
AtomicBombTest >> testAtomicBombAffectsAllShips [

	| game dices tiles |
	tiles := OrderedCollection new.
	20 timesRepeat: [ tiles add: (NoEffect create)].
	tiles at: 9 put: (AtomicBomb create).
	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 4 )).

	game := Game createOn: tiles toPlayWith: dices withARequired: 3 andWithThePlayers: 3.

	game play.
	game play.
	game play.
	self assert: ((game ship: 1) isAt: 5).
	self assert: ((game ship: 2) isAt: 5).
	self assert: ((game ship: 3) isAt: 5).
	game play.

	self assert: ((game ship: 1) isAt: 1).
	self assert: ((game ship: 2) isAt: 1).
	self assert: ((game ship: 3) isAt: 1)
]
