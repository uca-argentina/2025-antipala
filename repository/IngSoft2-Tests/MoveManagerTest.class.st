Class {
	#name : 'MoveManagerTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
MoveManagerTest >> testMoveManger [
| ship manager positionValue alapmanager|
alapmanager:=Lapmanager creatwithblock:10.
ship := Ship2 createWhithId:1 andWithFuel:10 andwithlapmanager:alapmanager.
manager := MoveManager create.
manager move: ship by: 10.
"ship changePositionTo: 10. no te deja porq es privado"
positionValue := ship instVarNamed: 'position'.

self assert: positionValue equals: 10. 

]

{ #category : 'tests' }
MoveManagerTest >> testMoveMangeraddseffectManager [
| ship manager alapmanager|
alapmanager:=Lapmanager creatwithblock:30.
ship := Ship2 createWhithId:1 andWithFuel:10 andwithlapmanager:alapmanager.
manager := MoveManager create.
manager move: ship by: 10.

]

{ #category : 'tests' }
MoveManagerTest >> testMoveMangersebloque [
| ship manager  alapmanager|
alapmanager:=Lapmanager creatwithblock:30..
ship := Ship2 createWhithId:1 andWithFuel:10 andwithlapmanager:alapmanager.
manager := MoveManager create.
manager move: ship by: 10.
manager move: ship by: 10.
self assert:ship position equals:10.

]

{ #category : 'tests' }
MoveManagerTest >> testMoveMangersedebloquea [
| ship manager alapmanager|
alapmanager:=Lapmanager creatwithblock:30.
ship := Ship2 createWhithId:1 andWithFuel:10 andwithlapmanager:alapmanager.
manager := MoveManager create.
manager move: ship by: 10.
manager move: ship by: 10.
self assert:ship position equals:10.
manager move: ship by: 2.
manager move: ship by: 2.
manager move: ship by: 2.
self assert:ship position equals:12.

]
