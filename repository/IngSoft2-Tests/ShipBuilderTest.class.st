Class {
	#name : 'ShipBuilderTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
ShipBuilderTest >> testShipBuilderCanCreateAShip [
	
| ashipBuilder aship manager alapmanager dices |
alapmanager := Lapmanager createWith: 15.
dices := OrderedCollection new.
dices add: (Dice with: 6).

ashipBuilder := Shipbuilder buildWith: alapmanager and: dices.
aship := ashipBuilder build.
"Comprobar normal Funcionamiento de nave"
manager := MoveManager create.
manager move: aship by: 10.
self assert: aship position equals: 10

]

{ #category : 'tests' }
ShipBuilderTest >> testShipBuilderCanCreateSeveralShipsWithDiferentFuel [
	
| ashipBuilder alapmanager dices1 dices2 ship1 ship2  manager |
alapmanager := Lapmanager createWith: 20.
dices1 := OrderedCollection new.
dices1 add: (Dice with: 5).

ashipBuilder := Shipbuilder buildWith: alapmanager and: dices1.
ship1 := ashipBuilder build.

dices2 := OrderedCollection new.
dices2 add: (Dice with: 10).

ashipBuilder maxFuelWith: dices2.
ship2 := ashipBuilder build.

manager := MoveManager create.
manager move: ship1 by: 15.
manager move: ship2 by: 15.
self assert: (ship1 isAt: 0). 
self assert: (ship2 isAt: 15). 



]

{ #category : 'tests' }
ShipBuilderTest >> testShipBuilderCanCreateSeveralShipsWithDiferentId [
	
| ashipBuilder alapmanager dices ship1 ship2 ship3 |
alapmanager := Lapmanager createWith: 15.
dices := OrderedCollection new.
dices add: (Dice with: 6).

ashipBuilder := Shipbuilder buildWith: alapmanager and: dices.
ship1 := ashipBuilder build.
ship2 := ashipBuilder build.
ship3 := ashipBuilder build.


self assert: ship1 id equals: 1.
self assert: ship2 id equals: 2.
self assert: ship3 id equals: 3.

]
