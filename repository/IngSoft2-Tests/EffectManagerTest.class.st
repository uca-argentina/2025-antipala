Class {
	#name : 'EffectManagerTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
EffectManagerTest >> testEffectHandlerCanHandleAnAtomicBomb [

	| ship manager alapmanager effectmanager effectlist anAtomicBomb dices game |
	alapmanager := Lapmanager createWith: 30.
	ship := Ship
		        createWhithId: 1
		        andWithFuel: 20
		        andwithlapmanager: alapmanager.
	manager := MoveManager create.
	effectlist := OrderedCollection new.
	anAtomicBomb := AtomicBomb at: 10.
	effectlist add: anAtomicBomb.
	effectmanager := Effectsmanager createWith: effectlist and: manager.

	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #(5)).

	game := Game
		        createShipPlayer: 1
		        lengthOfBoard: 20
		        dices: dices
		        and: effectlist.

	game play.
	self assert: ((game ship: 1) isAt: 5).
	game play.

	self assert: ((game ship: 1) isAt: 0)
]
