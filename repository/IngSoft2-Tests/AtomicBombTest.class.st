Class {
	#name : 'AtomicBombTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
AtomicBombTest >> testWhenTheShipEnterAtomicBomb [
| ship manager alapmanager anAtomicBomb|
alapmanager:=Lapmanager creatwithblock:20.
ship := Ship2 createWhithId:1 andWithFuel:10 andwithlapmanager:alapmanager.
manager := MoveManager create.
manager move: ship by: 10.
anAtomicBomb :=AtomicBomb at:10.
anAtomicBomb applyEffectTo:ship.
self assert: ship position equals: 0. 


]
