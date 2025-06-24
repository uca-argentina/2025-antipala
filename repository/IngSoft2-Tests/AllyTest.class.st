Class {
	#name : 'AllyTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'test' }
AllyTest >> testwhenship1hasnofuelship2sharesfuelshipcanmove [
	
	
	
	
	| aCardManager aCard aShip aTargetShip alapmanager manager|
	alapmanager := LapManager createWith: 30.
	manager := MoveManager createWith: alapmanager .
	aCardManager:=CardManager new.
	aCard :=Ally new.
	aShip := Ship
		        createWhithId: 1
		        andWithFuel: 0.
				
	aTargetShip := Ship
		        createWhithId: 2
		        andWithFuel: 2.
	aCardManager apply: aCard from: aShip to: aTargetShip.
	manager move: aShip by: 10.
	
	
	self assert:   (aShip isAt: 0 )
]

{ #category : 'test' }
AllyTest >> testwhenship1hasnotenoughfuelship2sharesfuelship2cantmovehasgivenfuel [
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
		        andWithFuel: 5.
	aCardManager apply: aCard from: aShip to: aTargetShip.
	manager move: aShip by: 10.
	manager move: aTargetShip by: 10.
	
	
	self assert:   (aTargetShip isAt: 0 )
]

{ #category : 'test' }
AllyTest >> testwhenship1hasnotenoughfuelship2sharesfuelshipcanmove [
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
		        andWithFuel: 5.
	aCardManager apply: aCard from: aShip to: aTargetShip.
	manager move: aShip by: 10.
	
	
	self assert:   (aShip isAt: 10 )
]
