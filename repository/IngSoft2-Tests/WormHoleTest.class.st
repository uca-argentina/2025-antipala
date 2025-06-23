Class {
	#name : 'WormHoleTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'asserting' }
WormHoleTest >> should: anErrorBlock raise: anErrorClass withMessageText: errorMessage [

self
	should: anErrorBlock
	raise: anErrorClass
	withExceptionDo: [ :error | self assert: (error messageText)
			equals: errorMessage ]. 
	
	
]

{ #category : 'tests' }
WormHoleTest >> testAShipCanEnterTheWormHole [

	| wormhole aPositionY aPositionZ |
	aPositionY := 5.
	aPositionZ := 10.
	wormhole := WormHole at: aPositionY and: aPositionZ.


]

{ #category : 'tests' }
WormHoleTest >> testIfWeAreInTheYPositionTheWormHoleKnowsHowMuchToAddToTheDiceToBeInZ [

	|  effectlist dices game |
	effectlist := OrderedCollection new.
	effectlist add:( WormHole at: 10 and: 12).

	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 10 )).

	game := Game
		        createWith: 20
		        and: dices
		        and: effectlist
		        and: 3.
	game addShip.
	game play.
	self assert: ((game ship:1) isAt: 12)
]

{ #category : 'tests' }
WormHoleTest >> testWhenBothPositionsAreNegativeThrowAnError [

self
	should:[WormHole at:-20 and: -20]
	raise: Error
	withMessageText: 'The WormHole Position can not be negative'.
]

{ #category : 'tests' }
WormHoleTest >> testWhenThePositionYIsNegativeThrowAnError [
self
	should:[WormHole at:-20 and: 40]
	raise: Error
	withMessageText: 'The WormHole Position can not be negative'.
]

{ #category : 'tests' }
WormHoleTest >> testWhenThePositionZIsNegativeThrowAnError [
self
	should:[WormHole at:20 and: -20]
	raise: Error
	withMessageText: 'The WormHole Position can not be negative'.
]

{ #category : 'tests' }
WormHoleTest >> testWhenWeReceiveAPositionWeCanCheckIfItIsAWormHolePosition [

	| aPositionY aPositionZ wormhole ship aMoveManager alapmanager |
	aPositionY := 10.
	aPositionZ := 15.
	wormhole := WormHole at: aPositionY and: aPositionZ.
	alapmanager:= Lapmanager createWith: 50.
	ship := Ship
		        createWhithId: 1
		        andWithFuel: 50.
	aMoveManager := MoveManager createWith: alapmanager.
	aMoveManager move: ship by: 10.


	self assert: (wormhole shouldApplyTo: ship).
	
	aMoveManager move: ship by: 5.
	
	self assert: (wormhole shouldApplyTo: ship).
	
	aMoveManager move: ship by: 5.
	
	self deny: (wormhole shouldApplyTo: ship).
]
