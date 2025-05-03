Class {
	#name : 'ShipTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
ShipTest >> testShipCanChangePosition [
	| ship |
	ship := Ship new.
	ship setPosition: 3.
	self assert: ship getPosition equals: 3
]

{ #category : 'tests' }
ShipTest >> testShipInitialPositionShouldBe0 [
	| ship |
	ship := Ship new.
	self assert: ship getPosition equals: 0
]
