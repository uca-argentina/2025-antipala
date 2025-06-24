Class {
	#name : 'CardManagerTest',
	#superclass : 'TestCase',
	#classInstVars : [
		'activeCards'
	],
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'as yet unclassified' }
CardManagerTest >> testapplycardeffectoshiptest [
	
	
	
	
	| aCardManager aCard aShip aTargetShip alapmanager manager|
	alapmanager := LapManager createWith: 30.
	manager := MoveManager createWith: alapmanager .
	aCardManager:=CardManager new.
	aCard :=Ally new.
	aShip := Ship
		        createWhithId: 1
		        andWithFuel: 5.
				
	aTargetShip := Ship
		        createWhithId: 2
		        andWithFuel: 2.
	aCardManager apply: aCard from: aShip to: aTargetShip.
	manager move: aShip by: 10.
	
	
	self assert:   (aShip isAt: 0 )
]
