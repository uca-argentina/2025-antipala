Class {
	#name : 'ShipBuilderTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'asserting' }
ShipBuilderTest >> should: anErrorBlock raise: anErrorClass withMessageText: errorMessage [
	self
		should: anErrorBlock
		raise: anErrorClass
		withExceptionDo: [ :error |
			self assert: (error messageText) equals: errorMessage ].
]

{ #category : 'tests' }
ShipBuilderTest >> testShipBuilderCanCreateAShip [

	| ashipBuilder aship manager dices |
	dices := OrderedCollection new.
	dices add: (Dice with: 6).

	ashipBuilder := ShipBuilder buildWith: dices.
	aship := ashipBuilder build.
	"Comprobar normal Funcionamiento de nave"
	manager := MoveManager createWith: 15 and: (CardManager create).
	manager move: aship by: 10.
	self assert: (aship isAt: 11)
]

{ #category : 'tests' }
ShipBuilderTest >> testShipBuilderCanCreateSeveralShipsWithDiferentFuel [

	| ashipBuilder dices1 dices2 ship1 ship2 manager |
	dices1 := OrderedCollection new.
	dices1 add: (Dice with: 5).

	ashipBuilder := ShipBuilder buildWith: dices1.
	ship1 := ashipBuilder build.

	dices2 := OrderedCollection new.
	dices2 add: (Dice with: 10).

	ashipBuilder maxFuelWith: dices2.
	ship2 := ashipBuilder build.

	manager := MoveManager createWith: 20 and: (CardManager create).
	manager move: ship1 by: 15.
	manager move: ship2 by: 15.
	self assert: (ship1 isAt: 1).
	self assert: (ship2 isAt: 16)
]

{ #category : 'tests' }
ShipBuilderTest >> testShipBuilderCanCreateSeveralShipsWithDiferentId [
	
| ashipBuilder dices ship1 ship2 ship3 |
dices := OrderedCollection new.
dices add: (Dice with: 6).

ashipBuilder := ShipBuilder buildWith: dices.
ship1 := ashipBuilder build.
ship2 := ashipBuilder build.
ship3 := ashipBuilder build.


self assert: ship1 id equals: 1.
self assert: ship2 id equals: 2.
self assert: ship3 id equals: 3.

]

{ #category : 'tests' }
ShipBuilderTest >> testShipCannotBeCreatedWithNegativeFuel [
	self should: [ Ship createWhithId: 1 andWithFuel: -5 ]
		raise: Error
		withMessageText: 'El fuel must be positive'.
]

{ #category : 'tests' }
ShipBuilderTest >> testShipCannotBeCreatedWithNegativeIdorNil [
	self should: [ Ship createWhithId: -1 andWithFuel: 15 ]
		raise: Error
		withMessageText: 'The Ship ID must be a positive number'.
]
