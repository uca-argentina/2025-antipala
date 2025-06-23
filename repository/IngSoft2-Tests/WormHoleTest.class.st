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

	| wormhole effectlist dices ship aMoveManager effectManager game alapmanager |
	effectlist := OrderedCollection new.
	wormhole := WormHole at: 10 and: 12.
	effectlist add: wormhole.

	dices := OrderedCollection new.
	dices add: (ChargeDice createWith: #( 5 )).
	alapmanager:=(Lapmanager createWith: 50).
	ship := Ship
		        createWhithId: 1
		        andWithFuel: 50.
	aMoveManager := MoveManager createWith: alapmanager.
	effectManager := Effectsmanager
		                 createWith: effectlist
		                 and: aMoveManager.

	game := Game
		        createShipPlayer: 1
		        lengthOfBoard: 50
		        dices: dices
		        and: effectlist. "no es necesario que haga nada, pero se pide para otros efectos"

	aMoveManager move: ship by: 10.
	effectManager applyAnEffectTo: ship in: game with: 5.
	self assert: (ship isAt: 12)
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
