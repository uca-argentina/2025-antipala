Class {
	#name : 'LapManagerTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
LapManagerTest >> testNegativeLaps [

	| ship manager alapmanager |
	alapmanager := LapManager createWith: 10.
	ship := Ship createWhithId: 1 andWithFuel: 100.
	manager := MoveManager createWith: alapmanager and: (CardManager createWith: #(  )).
	manager move: ship by: 25.
	self assert: (ship isAtLap: 2).
	manager move: ship by: -25.
	self assert: (ship isAtLap: 0)
]

{ #category : 'tests' }
LapManagerTest >> testTheShipCannotHaveNegativeLaps [

	| ship manager alapmanager |
	alapmanager := LapManager createWith: 10.
	ship := Ship createWhithId: 1 andWithFuel: 100.
	manager := MoveManager createWith: alapmanager and: (CardManager createWith: #(  )).
	manager move: ship by: -25.
	self assert: (ship isAtLap: 0)
]

{ #category : 'tests' }
LapManagerTest >> testWhenShipsPassTheBoardLenghtThenIncreaseTheLapNumber [

	| ship manager alapmanager |
	alapmanager := LapManager createWith: 10.
	ship := Ship createWhithId: 1 andWithFuel: 10.
	manager := MoveManager createWith: alapmanager and: (CardManager createWith: #(  )).
	manager move: ship by: 10.
	self assert: (ship isAtLap: 1)
]
