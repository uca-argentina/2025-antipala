Class {
	#name : 'ShipBuilderTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
ShipBuilderTest >> testWhenInitializeAShipThenItHasTheCorrectFuel [
	| dices builder ship dices2 builder2 ship2 |
	dices := OrderedCollection new.
	dices add: (Dice with:6).
	
	dices2 := OrderedCollection new.
	dices2 add: (Dice with:6).
	dices2 add: (Dice with:4).
	
	builder:= ShipBuilder createWith: dices.
	ship:= builder build.
	
	builder2:= ShipBuilder createWith: dices2.
	ship2:= builder2 build.
	
	self assert: (ship isWithFuel: 12).
		
	self assert: (ship2 isWithFuel: 20).
]

{ #category : 'tests' }
ShipBuilderTest >> testWhenInitializeAShipThenItHasTheCorrectId [
	| dices builder ship |
	dices := OrderedCollection new.
	dices add: (Dice with:6).
	
	builder:= ShipBuilder createWith: dices.
	ship:= builder build.
		
	self assert: (ship getId ) equals: 1.
]

{ #category : 'tests' }
ShipBuilderTest >> testWhenInitializeAShipThenItHasTheCorrectPosition [
	| dices builder ship |
	dices := OrderedCollection new.
	dices add: (Dice with:6).
	
	builder:= ShipBuilder createWith: dices.
	ship:= builder build.
	
	self assert: (ship isInPosition: 0).
]

{ #category : 'tests' }
ShipBuilderTest >> testWhenInitializingSomeShipsThenTheyHasTheCorrectId [
	| dices builder ship1 ship2 ship3 |
	dices := OrderedCollection new.
	dices add: (Dice with:6).
	
	builder:= ShipBuilder createWith: dices.
	ship1:= builder build.
	ship2:= builder build.
	ship3:= builder build.
		
	self assert: (ship1 getId ) equals: 1.
	self assert: (ship2 getId ) equals: 2.
	self assert: (ship3 getId ) equals: 3.
]
