Class {
	#name : 'MoveManagerTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
MoveManagerTest >> testBlockedShipsShouldntMoveForSomeTurns [

	| ship manager alapmanager |
	alapmanager := LapManager createWith: 30.
	ship := Ship createWhithId: 1 andWithFuel: 10.
	manager := MoveManager createWith: alapmanager and: (CardManager createWith: #(  )).
	manager move: ship by: 10.
	self assert: (ship isAt: 10).
	manager move: ship by: 10. "Ship se bloquea, agrega un timeout de 2, pero reduce en 1 ese turno"
	self assert: (ship isAt: 0).
	manager move: ship by: 2. "Timeout: 1->0"
	manager move: ship by: 2. "ship pos = 2"
	manager move: ship by: 2. "ship pos = 4"
	self assert: (ship isAt: 4)
]

{ #category : 'tests' }
MoveManagerTest >> testMoveManagerBlocksTheShipsForSeveralTurnsWhenOutOfFuel [

	| ship manager alapmanager |
	alapmanager := LapManager createWith: 30.
	ship := Ship createWhithId: 1 andWithFuel: 10.
	manager := MoveManager createWith: alapmanager and: (CardManager createWith: #(  )).
	manager move: ship by: 10.
	manager move: ship by: 10.
	self assert: (ship isAt: 0).
	manager move: ship by: 2.
	manager move: ship by: 2.
	manager move: ship by: 2.
	self assert: (ship isAt: 4)
]

{ #category : 'tests' }
MoveManagerTest >> testMoveManagerCanHandleSeveralShips [

	| manager alapmanager ship1 ship2 |
	alapmanager := LapManager createWith: 30.
	ship1 := Ship createWhithId: 1 andWithFuel: 10.
	ship2 := Ship createWhithId: 2 andWithFuel: 20.
	manager := MoveManager createWith: alapmanager and: (CardManager createWith: #(  )).
	manager move: ship1 by: 15.
	manager move: ship2 by: 15.
	self assert: (ship1 isAt: 0).
	self assert: (ship2 isAt: 15).
	self assert: ship1 id equals: 1.
	self assert: ship2 id equals: 2
]

{ #category : 'tests' }
MoveManagerTest >> testMoveManagerCanMoveShips [

	| ship manager alapmanager |
	alapmanager := LapManager createWith: 15.
	ship := Ship createWhithId: 1 andWithFuel: 10.
	manager := MoveManager createWith: alapmanager and: (CardManager createWith: #(  )).
	manager move: ship by: 10.
	"ship changePositionTo: 10. no te deja porq es privado"
	"positionValue := ship instVarNamed: 'position'."

	self assert: (ship isAt: 10)
]

{ #category : 'tests' }
MoveManagerTest >> testMoveManagerResetThePositionOfShipsWhenOutOfFuel [

	| ship manager alapmanager |
	alapmanager := LapManager createWith: 30.
	ship := Ship createWhithId: 1 andWithFuel: 10.
	manager := MoveManager createWith: alapmanager and: (CardManager createWith: #(  )).
	manager move: ship by: 10.
	manager move: ship by: 10.
	self assert: (ship isAt: 0)
]

{ #category : 'tests' }
MoveManagerTest >> testMoveManagerResetThePositionOfShipsWhenTheShipsShouldntMove [

	| ship manager alapmanager |
	alapmanager := LapManager createWith: 30.
	ship := Ship createWhithId: 1 andWithFuel: 15.
	manager := MoveManager createWith: alapmanager and: (CardManager createWith: #(  )).
	manager move: ship by: 20.
	self assert: (ship isAt: 0)
]

{ #category : 'tests' }
MoveManagerTest >> testMoveManagerShouldHandleTheFuelOfTheShips [

	| ship manager alapmanager |
	alapmanager := LapManager createWith: 30.
	ship := Ship createWhithId: 1 andWithFuel: 10.
	manager := MoveManager createWith: alapmanager and: (CardManager createWith: #(  )).
	manager move: ship by: 3.
	self assert: ship fuel equals: 7.
	manager move: ship by: 3.
	self assert: ship fuel equals: 4.
	manager move: ship by: 10.
	self assert: ship fuel equals: 10.
	manager move: ship by: 5. "Ship Bloqueada"
	self assert: ship fuel equals: 10
]

{ #category : 'tests' }
MoveManagerTest >> testShipShouldHandleReffils [

	| ship manager alapmanager |
	alapmanager := LapManager createWith: 30.
	ship := Ship createWhithId: 1 andWithFuel: 10.
	manager := MoveManager createWith: alapmanager and: (CardManager createWith: #(  )).
	manager move: ship by: 6.
	self assert: ship fuel equals: 4.
	ship refillFuel.
	self assert: ship fuel equals: 10.
	manager move: ship by: 5.
	self assert: ship fuel equals: 5
]

{ #category : 'tests' }
MoveManagerTest >> testShipsCanTellIfTheyAreAheadOfAnotherShip [

	| manager alapmanager ship1 ship2 |
	alapmanager := LapManager createWith: 30.
	ship1 := Ship createWhithId: 1 andWithFuel: 10.
	ship2 := Ship createWhithId: 2 andWithFuel: 20.
	manager := MoveManager createWith: alapmanager and: (CardManager createWith: #(  )).
	manager move: ship1 by: 10.
	manager move: ship2 by: 10.
	self deny: (ship1 isAheadOf: ship2).
	self deny: (ship2 isAheadOf: ship1).

	manager move: ship2 by: 10.
	self deny: (ship1 isAheadOf: ship2).
	self assert: (ship2 isAheadOf: ship1)
]

{ #category : 'tests' }
MoveManagerTest >> testTimeoutGeneratedByEffects [

	| ship manager alapmanager |
	alapmanager := LapManager createWith: 30.
	ship := Ship createWhithId: 1 andWithFuel: 10.
	manager := MoveManager createWith: alapmanager and: (CardManager createWith: #(  )).
	manager move: ship by: 5.
	self assert: (ship isWithTimeout: 0).
	manager block: ship by: 2.
	self assert: (ship isWithTimeout: 2).
	manager move: ship by: 5.
	self assert: (ship isWithTimeout: 1).
	manager move: ship by: 5.
	self assert: (ship isWithTimeout: 0)
]

{ #category : 'tests' }
MoveManagerTest >> testTimeoutGeneratedByLowFuel [

	| ship manager alapmanager |
	alapmanager := LapManager createWith: 30.
	ship := Ship createWhithId: 1 andWithFuel: 10.
	manager := MoveManager createWith: alapmanager and: (CardManager createWith: #(  )).
	manager move: ship by: 10.
	self assert: (ship isWithTimeout: 0).
	manager move: ship by: 10. "Ship se bloquea, agrega un timeout de 2, pero reduce en 1 ese turno"
	self assert: (ship isWithTimeout: 1).
	manager move: ship by: 2.
	self assert: (ship isWithTimeout: 0)
]
