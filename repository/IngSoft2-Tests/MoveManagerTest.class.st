Class {
	#name : 'MoveManagerTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'asserting' }
MoveManagerTest >> should: anErrorBlock raise: anErrorClass withMessageText: errorMessage [
	self
		should: anErrorBlock
		raise: anErrorClass
		withExceptionDo: [ :error |
			self assert: (error messageText) equals: errorMessage ].
]

{ #category : 'tests' }
MoveManagerTest >> testBlockedShipsShouldntMoveForSomeTurns [

	| ship manager aBoardSize|
	ship := Ship createWhithId: 1 andWithFuel: 10.
	aBoardSize:=30.
	manager := MoveManager createWith: aBoardSize and: (CardManager createWith: #(  )).
	manager move: ship by: 10.
	self assert: (ship isAt: 11).
	manager move: ship by: 10. "Ship se bloquea, agrega un timeout de 2, pero reduce en 1 ese turno"
	self assert: (ship isAt: 1).
	manager move: ship by: 2. "Timeout: 1->0"
	manager move: ship by: 2. "ship pos = 2"
	manager move: ship by: 2. "ship pos = 4"
	self assert: (ship isAt: 5)
]

{ #category : 'tests' }
MoveManagerTest >> testMoveManagerBlocksTheShipsForSeveralTurnsWhenOutOfFuel [

	| ship manager aBoardSize |
	aBoardSize:=30.
	ship := Ship createWhithId: 1 andWithFuel: 10.
	manager := MoveManager createWith: aBoardSize and: (CardManager createWith: #(  )).
	manager move: ship by: 10.
	manager move: ship by: 10.
	self assert: (ship isAt: 1).
	manager move: ship by: 2.
	manager move: ship by: 2.
	manager move: ship by: 2.
	self assert: (ship isAt: 5)
]

{ #category : 'tests' }
MoveManagerTest >> testMoveManagerCanHandleSeveralShips [

	| manager ship1 ship2 aBoardSize|
	aBoardSize:=30.
	ship1 := Ship createWhithId: 1 andWithFuel: 10.
	ship2 := Ship createWhithId: 2 andWithFuel: 20.
	manager := MoveManager createWith: aBoardSize and: (CardManager createWith: #(  )).
	manager move: ship1 by: 15.
	manager move: ship2 by: 15.
	self assert: (ship1 isAt: 1).
	self assert: (ship2 isAt: 16).
	self assert: ship1 id equals: 1.
	self assert: ship2 id equals: 2
]

{ #category : 'tests' }
MoveManagerTest >> testMoveManagerCanMoveShips [

	| ship manager aBoardSize |
	aBoardSize := 15.
	ship := Ship createWhithId: 1 andWithFuel: 10.
	manager := MoveManager createWith: aBoardSize and: (CardManager createWith: #(  )).
	manager move: ship by: 10.
	self assert: (ship isAt: 11)
]

{ #category : 'tests' }
MoveManagerTest >> testMoveManagerCannotBeIniciatedWithAnInvalidBoardSize [
	self should: [ MoveManager createWith: -4 and: (CardManager createWith: #(  )). ]
		raise: Error
		withMessageText: 'The BoardSize must be equal or greater than 4 squares.'.
]

{ #category : 'tests' }
MoveManagerTest >> testMoveManagerCannotBeIniciatedWithoutACardManager [
	self should: [ MoveManager createWith: 40 and: nil ]
		raise: Error
		withMessageText: 'The MoveManager must have a CardManager.'.
]

{ #category : 'tests' }
MoveManagerTest >> testMoveManagerResetThePositionOfShipsWhenOutOfFuel [

	| ship manager aBoardSize |
	aBoardSize:= 30.
	ship := Ship createWhithId: 1 andWithFuel: 10.
	manager := MoveManager createWith: aBoardSize and: (CardManager createWith: #(  )).
	manager move: ship by: 10.
	manager move: ship by: 10.
	self assert: (ship isAt: 1)
]

{ #category : 'tests' }
MoveManagerTest >> testMoveManagerResetThePositionOfShipsWhenTheShipsShouldntMove [

	| ship manager aBoardSize |
	aBoardSize := 30.
	ship := Ship createWhithId: 1 andWithFuel: 15.
	manager := MoveManager createWith: aBoardSize and: (CardManager createWith: #(  )).
	manager move: ship by: 20.
	self assert: (ship isAt: 1)
]

{ #category : 'tests' }
MoveManagerTest >> testMoveManagerShouldHandleTheFuelOfTheShips [

	| ship manager aBoardSize |
	aBoardSize := 30.
	ship := Ship createWhithId: 1 andWithFuel: 10.
	manager := MoveManager createWith: aBoardSize and: (CardManager createWith: #(  )).
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
MoveManagerTest >> testNegativeLaps [

	| ship manager |
	ship := Ship createWhithId: 1 andWithFuel: 100.
	manager := MoveManager createWith: 10 and: (CardManager createWith: #(  )).
	manager move: ship by: 25.
	self assert: (ship isAtLap: 2).
	manager move: ship by: -25.
	self assert: (ship isAtLap: 0)
]

{ #category : 'tests' }
MoveManagerTest >> testShipShouldHandleReffils [

	| ship manager aBoardSize |
	aBoardSize:=30.
	ship := Ship createWhithId: 1 andWithFuel: 10.
	manager := MoveManager createWith: aBoardSize and: (CardManager createWith: #(  )).
	manager move: ship by: 6.
	self assert: ship fuel equals: 4.
	ship refillFuel.
	self assert: ship fuel equals: 10.
	manager move: ship by: 5.
	self assert: ship fuel equals: 5
]

{ #category : 'tests' }
MoveManagerTest >> testShipsCanTellIfTheyAreAheadOfAnotherShip [

	| manager aBoardSize ship1 ship2 |
	aBoardSize := 30.
	ship1 := Ship createWhithId: 1 andWithFuel: 10.
	ship2 := Ship createWhithId: 2 andWithFuel: 20.
	manager := MoveManager createWith: aBoardSize and: (CardManager createWith: #(  )).
	manager move: ship1 by: 10.
	manager move: ship2 by: 10.
	self deny: (ship1 isAheadOf: ship2).
	self deny: (ship2 isAheadOf: ship1).

	manager move: ship2 by: 10.
	self deny: (ship1 isAheadOf: ship2).
	self assert: (ship2 isAheadOf: ship1)
]

{ #category : 'tests' }
MoveManagerTest >> testTheShipCannotHaveNegativeLaps [

	| ship manager |
	ship := Ship createWhithId: 1 andWithFuel: 100.
	manager := MoveManager createWith: 10 and: (CardManager createWith: #(  )).
	manager move: ship by: -25.
	self assert: (ship isAtLap: 0)
]

{ #category : 'tests' }
MoveManagerTest >> testTimeoutGeneratedByEffects [

	| ship manager aBoardSize |
	aBoardSize:= 30.
	ship := Ship createWhithId: 1 andWithFuel: 10.
	manager := MoveManager createWith: aBoardSize and: (CardManager createWith: #(  )).
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

	| ship manager aBoardSize |
	aBoardSize:= 30.
	ship := Ship createWhithId: 1 andWithFuel: 10.
	manager := MoveManager createWith: aBoardSize and: (CardManager createWith: #(  )).
	manager move: ship by: 10.
	self assert: (ship isWithTimeout: 0).
	manager move: ship by: 10. "Ship se bloquea, agrega un timeout de 2, pero reduce en 1 ese turno"
	self assert: (ship isWithTimeout: 1).
	manager move: ship by: 2.
	self assert: (ship isWithTimeout: 0)
]

{ #category : 'tests' }
MoveManagerTest >> testWhenShipsPassTheBoardLenghtThenIncreaseTheLapNumber [

	| ship manager |
	ship := Ship createWhithId: 1 andWithFuel: 10.
	manager := MoveManager createWith: 10 and: (CardManager createWith: #(  )).
	manager move: ship by: 10.
	self assert: (ship isAtLap: 1)
]
