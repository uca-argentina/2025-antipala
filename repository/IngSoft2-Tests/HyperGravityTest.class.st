Class {
	#name : 'HyperGravityTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
HyperGravityTest >> testBanana [
|alapmanager ship manager hyper|
	alapmanager:=Lapmanager createWith:20.
	ship := Ship2 createWhithId:1 andWithFuel:10 andwithlapmanager:alapmanager.
	hyper:= HyperGravity atPosition: 5 withValue: 1.
	manager := MoveManager create.
	manager move: ship by: 5.
	hyper applyEffectTo: ship.
	self assert: (ship isAt: 5).
]
