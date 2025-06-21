Class {
	#name : 'HyperGravityTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
HyperGravityTest >> testTheShipEnterInAHyperGravitySquare [

	| ship manager alapmanager hyperGravity|
	alapmanager:=Lapmanager createWith:20.
	ship := Ship2 createWhithId:1 andWithFuel:10 andwithlapmanager:alapmanager.
	hyperGravity:= HyperGravity atPosition: 5  withValue: 15. 
	manager := MoveManager create.
	manager move: ship by: 5.
	hyperGravity applyEffectTo: ship.
	self assert: (ship hyperGravityStatus  = true).
]

{ #category : 'tests' }
HyperGravityTest >> testTheShipEnterInAHyperGravitySquareAndCannotMove [

	| ship manager alapmanager hyperGravity|
	alapmanager:=Lapmanager createWith:20.
	ship := Ship2 createWhithId:1 andWithFuel:10 andwithlapmanager:alapmanager.
	hyperGravity:= HyperGravity atPosition: 5  withValue: 15. 
	manager := MoveManager create.
	manager move: ship by: 5.
	hyperGravity applyEffectTo: ship.
	manager move: ship by: 5.
	self assert: (ship hyperGravityStatus  = true).
	self assert: (ship position = 5).
]

{ #category : 'tests' }
HyperGravityTest >> testTheShipUnlockTheHyperGravity [

	| ship manager alapmanager hyperGravity|
	alapmanager:=Lapmanager createWith:20.
	ship := Ship2 createWhithId:1 andWithFuel:100 andwithlapmanager:alapmanager.
	hyperGravity:= HyperGravity atPosition: 5  withValue: 15. 
	manager := MoveManager create.
	manager move: ship by: 5.
	hyperGravity applyEffectTo: ship.
	manager move: ship by: 20.
	manager move: ship by: 5.
	self assert: (ship hyperGravityStatus  = false).
	self assert: (ship position = 10).
]
