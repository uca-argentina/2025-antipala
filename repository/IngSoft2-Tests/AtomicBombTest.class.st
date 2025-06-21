Class {
	#name : 'AtomicBombTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
AtomicBombTest >> testSeveralShipsCanGetAffected [
| manager alapmanager anAtomicBomb ship1 ship2 ship3 effectlist effectmanager |
alapmanager:=Lapmanager createWith:20.
ship1 := Ship2 createWhithId:1 andWithFuel:15 andwithlapmanager:alapmanager.
ship2 := Ship2 createWhithId:2 andWithFuel:15 andwithlapmanager:alapmanager.
ship3 := Ship2 createWhithId:3 andWithFuel:15 andwithlapmanager:alapmanager.

manager := MoveManager create.
effectlist:=OrderedCollection new.
anAtomicBomb :=AtomicBomb at:10.
effectlist add:anAtomicBomb.
effectmanager:=Effectsmanager creatwitheffect:effectlist.


manager move: ship1 by: 5.
effectmanager applyAnEffectTo: ship1.
self assert: ship1 position equals: 5. 

manager move: ship2 by: 5.
effectmanager applyAnEffectTo: ship2.
self assert: ship2 position equals: 5. 

manager move: ship3 by: 10.
effectmanager applyAnEffectTo: ship3.
effectmanager applyAnEffectTo: ship1.
effectmanager applyAnEffectTo: ship2.


self assert: ship1 position equals: 0. 
self assert: ship2 position equals: 0. 
self assert: ship3 position equals: 0. 

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
