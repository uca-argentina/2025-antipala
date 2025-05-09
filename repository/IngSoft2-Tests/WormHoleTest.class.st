Class {
	#name : 'WormHoleTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
WormHoleTest >> testIfWeAreInTheYPositionTheWormHoleKnowsHowMuchToAddToTheDiceToBeInZ [

	| aPositionY aPositionZ wormhole myActualPosition result |
	aPositionY:=10.
	aPositionZ:=20.
	myActualPosition:= 10.
	wormhole:= WormHole at:aPositionY and: aPositionZ.
	
	result:= wormhole applyWormEffectTo: myActualPosition.
	self assert:(result = 10).
]

{ #category : 'tests' }
WormHoleTest >> testIfWeAreInTheZPositionTheWormHoleKnowsHowMuchToSubTractToTheDiceToBeInY [
	| aPositionY aPositionZ wormhole myActualPosition result |
	aPositionY:=10.
	aPositionZ:=30.
	myActualPosition:= 30.
	wormhole:= WormHole at:aPositionY and: aPositionZ.
	
	result:= wormhole applyWormEffectTo: myActualPosition.
	self assert:(result = -20).
]

{ #category : 'tests' }
WormHoleTest >> testWhenWeAskToTheWormHoleWhereIsPositionYHeCanAnswerIt [

	| wormhole aPositionY |
	aPositionY:=10.
	wormhole:= WormHole at:aPositionY.
	
	self assert:(wormhole whereIsMyPositionY=10).
	
	
]

{ #category : 'tests' }
WormHoleTest >> testWhenWeAskToThenWormHoleWhereIsPositionZHeCanAnswerIt [
	| aPositionY aPositionZ wormhole |
	aPositionY:=10.
	aPositionZ:=20.
	wormhole:= WormHole at:aPositionY and: aPositionZ.
	
	self assert:(wormhole whereIsMyPositionZ=20).
]

{ #category : 'tests' }
WormHoleTest >> testWhenWeReceiveAPositionWeCanCheckIfItIsAWormHolePosition [
	| aPositionY aPositionZ wormhole |
	aPositionY:=10.
	aPositionZ:=20.
	wormhole:= WormHole at:aPositionY and: aPositionZ.
	
	
	self assert:(wormhole validatePosition: 20).
]
