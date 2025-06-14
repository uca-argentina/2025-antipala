Class {
	#name : 'ShipTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
ShipTest >> testShipCanAdvance [
	| ship totalSquares |
	totalSquares:= 20.
	ship := Ship create:1.
	ship advance:2 withBoardSize: totalSquares.
	self assert: (ship isInPosition:2)
]

{ #category : 'tests' }
ShipTest >> testShipCanAdvanceTurn [
	| ship |
	ship := Ship create:1.
	ship advanceTurn.
	self assert: ship turn equals: 1
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
	self assert: (ship isInPosition:0).
]

{ #category : 'tests' }
ShipTest >> testShipMaxFuelIsDoubleDiceMaxThrow [
	| ship |
	ship := Ship create:1.
	ship setfuel:10.
		self assert: ship fuel equals: 20.
]

{ #category : 'tests' }
ShipTest >> testShipStartAtLap0 [

	| ship |
	ship := Ship create: 1.
	self assert: (ship isInLap: 0)
]

{ #category : 'tests' }
ShipTest >> testShipTurnis0 [
	| ship |
	ship := Ship create:1.
	self assert: ship turn equals: 0.
]

{ #category : 'tests' }
ShipTest >> testWhenShipPassesTheBoardSizeThenTheNumberOfLapsIncreasesTheExpectedAmount [

	| ship totalSquares |
	totalSquares:= 5.
	ship := Ship create: 1.
	
	self assert: (ship isInLap: 0).
	
	ship advance:6 withBoardSize: totalSquares.
	self deny: (ship isInLap: 0).
	
	ship advance:4 withBoardSize: totalSquares.
	self assert: (ship isInLap: 2).
	
	ship advance:20 withBoardSize: totalSquares.
	self assert: (ship isInLap: 6).
	
	ship advance:(-20) withBoardSize: totalSquares.
	self assert: (ship isInLap: 2).
]

{ #category : 'tests' }
ShipTest >> testWhenTheShipPassesTheBoardSizeThenThePositionRespondsToTheCircularBoardLogic [

	| ship totalSquares |
	totalSquares:= 5.
	ship := Ship create: 1.
	ship advance:7 withBoardSize: totalSquares.
	self assert: (ship isInPosition: 2).
	
	ship advance: 20 withBoardSize: totalSquares.
	self assert: (ship isInPosition: 2).

	ship advance: 6 withBoardSize: totalSquares.
	self assert: (ship isInPosition: 3).	
]
