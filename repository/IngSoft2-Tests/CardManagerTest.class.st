Class {
	#name : 'CardManagerTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'as yet unclassified' }
CardManagerTest >> testapplycardeffectoshiptest [

	| aCardManager aCard aShip aTargetShip manager |
	manager := MoveManager createWith: 30 
		               and: (CardManager create).
	aCardManager := CardManager create .
	aCard := Ally create.
	aShip := Ship createWhithId: 1 andWithFuel: 5.

	aTargetShip := Ship createWhithId: 2 andWithFuel: 2.
	
	aShip addCard: aCard .
	aCardManager apply: aCard from: aShip to: aTargetShip.
	manager move: aShip by: 10.


	self assert: (aShip isAt: 1)
]
