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
