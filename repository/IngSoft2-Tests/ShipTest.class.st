Class {
	#name : 'ShipTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
ShipTest >> testColectionOfShips [
	| ships player|

ships := OrderedCollection new.
ships add: ( Ship create: 1 ).
ships add: ( Ship create: 2 ).
ships add: ( Ship create: 3 ).
ships add: ( Ship create: 4 ).
ships add: ( Ship create: 5 ).
player := ships at: 2.
self assert: player position equals: 0
]

{ #category : 'tests' }
ShipTest >> testShipCanAdvance [
	| ship |
	ship := Ship new.
	ship moveTo: 3.
	ship advance: 2.
	self assert: ship position equals: 5
]

{ #category : 'tests' }
ShipTest >> testShipCanChangePosition [
	| ship |
	ship := Ship new.
	ship moveTo: 3.
	self assert: ship position equals: 3
]

{ #category : 'tests' }
ShipTest >> testShipInitialPositionShouldBe0 [
	| ship |
	ship := Ship create:1.
	self assert: ship position equals: 0
]
