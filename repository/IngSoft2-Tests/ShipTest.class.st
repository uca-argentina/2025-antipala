Class {
	#name : 'ShipTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
ShipTest >> testShipCanAdvance [
	| ship |
	ship := Ship new.
	ship moveTo: 3.
	ship advance: 2.
	self assert: ship position equals: 5
]

{ #category : 'tests' }
ShipTest >> testShipCanAdvanceTurn [
	| ship |
	ship := Ship create:1.
	ship advanceTurn.
	self assert: ship turn equals: 1
]

{ #category : 'tests' }
ShipTest >> testShipCanChangePosition [
	| ship |
	ship := Ship new.
	ship moveTo: 3.
	self assert: ship position equals: 3
]

{ #category : 'tests' }
ShipTest >> testShipFuelChange [
	| ship |
	ship := Ship create:1.
	ship spendfuel:10.
	self assert: ship fuel equals:90.
]

{ #category : 'tests' }
ShipTest >> testShipFuelis100 [
	| ship |
	ship := Ship create:1.
	self assert: ship fuel equals: 100.
]

{ #category : 'tests' }
ShipTest >> testShipInitialPositionShouldBe0 [
	| ship |
	ship := Ship create:1.
	self assert: ship position equals: 0
]

{ #category : 'tests' }
ShipTest >> testShipStartAtLap0 [

	| ship |
	ship := Ship create: 1.
	self assert: ship laps equals: 0
]

{ #category : 'tests' }
ShipTest >> testShipTurnis0 [
	| ship |
	ship := Ship create:1.
	self assert: ship turn equals: 0.
]
