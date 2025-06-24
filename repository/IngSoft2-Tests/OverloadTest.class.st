Class {
	#name : 'OverloadTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'test' }
OverloadTest >> testwhenship1overloadship2andmoveless [
	
	
	
	
	| aCardManager aCard aShip aTargetShip alapmanager manager|
	alapmanager := LapManager createWith: 30.
	manager := MoveManager createWith: alapmanager .
	aCardManager:=CardManager new.
	aCard :=Overload new.
	aShip := Ship
		        createWhithId: 1
		        andWithFuel: 20.
				
	aTargetShip := Ship
		        createWhithId: 2
		        andWithFuel: 20.
	aCardManager apply: aCard from: aShip to: aTargetShip.
	manager move: aTargetShip by: 10.
	self assert:   (aTargetShip isAt:8)
]
