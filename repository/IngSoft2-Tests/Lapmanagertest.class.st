Class {
	#name : 'Lapmanagertest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'test' }
Lapmanagertest >> testNegativeLaps [
| ship manager  alapmanager|
alapmanager:=Lapmanager createWith:10.
ship := Ship2 createWhithId:1 andWithFuel:100 andwithlapmanager:alapmanager.
manager := MoveManager create.
manager move: ship by: 25.
self assert: ship laps equals:2. 
manager move: ship by: -25.
self assert: ship laps equals:0. 
]

{ #category : 'test' }
Lapmanagertest >> testTheShipCannotHaveNegativeLaps [
| ship manager  alapmanager|
alapmanager:=Lapmanager createWith:10.
ship := Ship2 createWhithId:1 andWithFuel:100 andwithlapmanager:alapmanager.
manager := MoveManager create.
manager move: ship by: -25.
self assert: ship laps equals:0. 
]

{ #category : 'test' }
Lapmanagertest >> testWhenShipsPassTheBoardLenghtThenIncreaseTheLapNumber [
| ship manager  alapmanager|
alapmanager:=Lapmanager createWith:10.
ship := Ship2 createWhithId:1 andWithFuel:10 andwithlapmanager:alapmanager.
manager := MoveManager create.
manager move: ship by: 10.
self assert: ship laps equals:1. 
]
