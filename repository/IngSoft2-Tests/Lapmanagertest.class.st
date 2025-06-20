Class {
	#name : 'Lapmanagertest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'test' }
Lapmanagertest >> testlapManger [
| ship manager  alapmanager|
alapmanager:=Lapmanager creatwithblock:10.
ship := Ship2 createWhithId:1 andWithFuel:10 andwithlapmanager:alapmanager.
manager := MoveManager create.
manager move: ship by: 10.
self assert: ship laps equals:1. 
]
