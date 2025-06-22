Class {
	#name : 'BlackHoleTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
BlackHoleTest >> testWhenTheShipEnterInABlackHoleThenGoBack4Squares [

	| ship blackhole effectlist dices aMoveManager effectManager game |
	
	effectlist := OrderedCollection new.
	blackhole := BlackHole at: 5.
	effectlist add: blackhole.

	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 5 )).

	ship := Ship
		        createWhithId: 1
		        andWithFuel: 10
		        andwithlapmanager: (Lapmanager createWith: 20).
	aMoveManager := MoveManager create.
	effectManager := Effectsmanager
		                 createWith: effectlist
		                 and: aMoveManager.

	game := Game
		        createShipPlayer: 1
		        lengthOfBoard: 20
		        dices: dices
		        and: effectlist. "no es necesario que haga nada, pero se pide para otros efectos"

	aMoveManager move: ship by: 5.
	effectManager applyAnEffectTo: ship in: game with: 5.
	self assert: (ship isAt: 1).
]
