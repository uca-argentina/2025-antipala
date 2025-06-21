Class {
	#name : 'MoveManagerTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
MoveManagerTest >> testMoveManagerBlocksTheShipsForSeveralTurnsWhenOutOfFuel [
| ship manager alapmanager|
alapmanager:=Lapmanager createWith:30.
ship := Ship2 createWhithId:1 andWithFuel:10 andwithlapmanager:alapmanager.
manager := MoveManager create.
manager move: ship by: 10.
manager move: ship by: 10.
self assert: (ship isAt: 0). 
manager move: ship by: 2.
manager move: ship by: 2.
manager move: ship by: 2.
self assert: (ship isAt: 2). 

]

{ #category : 'tests' }
MoveManagerTest >> testMoveManagerCanMoveShips [
| ship manager alapmanager|
alapmanager :=Lapmanager createWith:15.
ship := Ship2 createWhithId:1 andWithFuel:10 andwithlapmanager:alapmanager.
manager := MoveManager create.
manager move: ship by: 10.
"ship changePositionTo: 10. no te deja porq es privado"
"positionValue := ship instVarNamed: 'position'."

self assert: (ship isAt: 10). 

]

{ #category : 'tests' }
MoveManagerTest >> testMoveManagerResetThePositionOfShipsWhenOutOfFuel [
| ship manager  alapmanager|
alapmanager:=Lapmanager createWith:30.
ship := Ship2 createWhithId:1 andWithFuel:10 andwithlapmanager:alapmanager.
manager := MoveManager create.
manager move: ship by: 10.
manager move: ship by: 10.
self assert: (ship isAt: 0). 

]

{ #category : 'tests' }
MoveManagerTest >> testMoveManagerResetThePositionOfShipsWhenTheShipsShouldntMove [
| ship manager  alapmanager|
alapmanager:=Lapmanager createWith:30.
ship := Ship2 createWhithId:1 andWithFuel:15 andwithlapmanager:alapmanager.
manager := MoveManager create.
manager move: ship by: 20.
self assert: (ship isAt: 0). 

]
