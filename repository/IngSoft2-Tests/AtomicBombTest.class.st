Class {
	#name : 'AtomicBombTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
AtomicBombTest >> testSeveralShipsCanGetAffected [
| alapmanager anAtomicBomb  effectlist game dices |
alapmanager:=Lapmanager createWith:20.

effectlist:=OrderedCollection new.
anAtomicBomb :=AtomicBomb at:10.
effectlist add:anAtomicBomb.

dices:=OrderedCollection new.
dices add: ChargeDice new.

game:= ShipGame createShipPlayer: 3 lengthOfBoard: 20 dices: dices and: effectlist.


game play.
game play.
game play.
	self assert: ((game ship:1) isAt: 5).
	self assert: ((game ship:2) isAt: 5).
	self assert: ((game ship:3) isAt: 5).
game play.

	self assert: ((game ship:1) isAt: 0).
	self assert: ((game ship:2) isAt: 0).
	self assert: ((game ship:3) isAt: 0).

]

{ #category : 'tests' }
AtomicBombTest >> testWhenTheShipEnterAtomicBomb [
| ship manager alapmanager anAtomicBomb|
alapmanager:=Lapmanager createWith:20.
ship := Ship2 createWhithId:1 andWithFuel:10 andwithlapmanager:alapmanager.
manager := MoveManager create.
manager move: ship by: 10.
anAtomicBomb :=AtomicBomb at:10.
anAtomicBomb applyEffectTo:ship.
self assert: ship position equals: 0. 


]
