Class {
	#name : 'EffectManagerTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'test' }
EffectManagerTest >> testashipfallinBlackWhole [
| ship manager  alapmanager effectmanager effectlist anAtomicBomb |
alapmanager:=Lapmanager creatwithblock:30.
ship := Ship2 createWhithId:1 andWithFuel:20 andwithlapmanager:alapmanager.
ship := Ship2 createWhithId:2 andWithFuel:20 andwithlapmanager:alapmanager.
manager := MoveManager create.
effectlist:=OrderedCollection new.
anAtomicBomb :=AtomicBomb at:10.
effectlist add:anAtomicBomb.
effectmanager:=Effectsmanager creatwitheffect:effectlist.
manager move: ship to: 10.
effectmanager applyanEffect:ship.
self assert: ship position equals: 0. 
]

{ #category : 'test' }
EffectManagerTest >> testashipfallinBlackWholewithitaffectallships [
| ship manager  alapmanager effectmanager effectlist anAtomicBomb ship2 |
alapmanager:=Lapmanager creatwithblock:30.
ship := Ship2 createWhithId:1 andWithFuel:20 andwithlapmanager:alapmanager.
ship2 := Ship2 createWhithId:2 andWithFuel:20 andwithlapmanager:alapmanager.
manager := MoveManager create.
effectlist:=OrderedCollection new.
anAtomicBomb :=AtomicBomb at:10.
effectlist add:anAtomicBomb.
effectmanager:=Effectsmanager creatwitheffect:effectlist.
manager move: ship to: 10.
effectmanager applyanEffect:ship.
self assert: ship position equals: 0. 
]
