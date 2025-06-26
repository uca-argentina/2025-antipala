Class {
	#name : 'EffectManagerTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
EffectManagerTest >> testEffectHandlerCanHandleAnAtomicBomb [


	| game dices tiles |
	tiles := OrderedCollection new.
	20 timesRepeat: [ tiles add: (NoEffect create)].
	tiles at: 9 put: (AtomicBomb create).
	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 4 )).

	game := Game createOn: tiles toPlayWith: dices withARequired: 3 andWithThePlayers: 1.
	game play.
	self assert: ((game ship: 1) isAt: 5).
	game play.

	self assert: ((game ship: 1) isAt: 1)
]

{ #category : 'tests' }
EffectManagerTest >> testEffectManagerCanForceAnEffect [

	| effectlist movemanager manageeffects ship efecto |
	efecto := BlackHole create .
	effectlist := OrderedCollection new.
	effectlist add: efecto.

	movemanager := MoveManager
		               createWith: (20)
		               and: (CardManager create).
	manageeffects := EffectsManager
		                 createWith: effectlist
		                 and: movemanager.
	ship := Ship createWhithId: 1 andWithFuel: 50.

	movemanager move: ship by: 10.
	efecto applyEffectTo: ship with: manageeffects.
	movemanager move: ship by: 1.
	self assert: (ship isAt: 8).
	manageeffects forceApplyLastEffectTo: ship.
	self assert: (ship isAt: 4)
]

{ #category : 'tests' }
EffectManagerTest >> testHyperGravityLastEffect [

	| tiles movemanager manageeffects ship efect |
	efect := HyperGravity createWith: 4 .
	tiles := OrderedCollection new.
	20 timesRepeat: [ tiles add: (NoEffect create)].
	tiles at: 10 put: (efect).

	movemanager := MoveManager
		               createWith: (20)
		               and: (CardManager create).
	manageeffects := EffectsManager
		                 createWith: tiles
		                 and: movemanager.
	ship := Ship createWhithId: 1 andWithFuel: 50.

	movemanager move: ship by: 9.
	efect applyEffectTo: ship with: manageeffects.
	movemanager move: ship by: 1.
	self assert: (ship isAt: 10).
	"manageeffects forceApplyLastEffectTo: ship.
	self assert: (ship isAt: 5)"
]
