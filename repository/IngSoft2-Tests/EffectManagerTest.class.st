Class {
	#name : 'EffectManagerTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
EffectManagerTest >> testEffectHandlerCanHandleAnAtomicBomb [

	|  effectlist  dices game |
	effectlist := OrderedCollection new.
	effectlist add:( AtomicBomb at: 10).

	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 5 )).

	game := Game
		        createWith: 20
		        and: dices
		        and: effectlist
		        and: 3.
	game addShip.
	game play.
	self assert: ((game ship: 1) isAt: 5).
	game play.

	self assert: ((game ship: 1) isAt: 0)
]
