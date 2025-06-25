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

{ #category : 'tests' }
EffectManagerTest >> testEffectManagerCanForceAnEffect [

	| effectlist movemanager manageeffects ship efecto |
	efecto := BlackHole at: 10.
	effectlist := OrderedCollection new.
	effectlist add: efecto.

	movemanager := MoveManager
		               createWith: (LapManager createWith: 20)
		               and: (CardManager createWith: #(  )).
	manageeffects := EffectsManager
		                 createWith: effectlist
		                 and: movemanager.
	ship := Ship createWhithId: 1 andWithFuel: 50.

	movemanager move: ship by: 10.
	efecto applyEffectTo: ship with: manageeffects.
	movemanager move: ship by: 1.
	self assert: (ship isAt: 7).
	manageeffects forceApplyLastEffectTo: ship.
	self assert: (ship isAt: 3)
]
