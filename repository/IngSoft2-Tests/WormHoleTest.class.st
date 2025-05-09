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
WormHoleTest >> testWhenWeAreInTheZTheWormHoleKnowsHowMuchToSubTractToTheDiceToBeInY [
	| aPositionY aPositionZ wormhole myActualPosition result |
	aPositionY:=10.
	aPositionZ:=30.
	myActualPosition:= 30.
	wormhole:= WormHole at:aPositionY and: aPositionZ.
	
	result:= wormhole applyWormEffectTo: myActualPosition.
	self assert:(result = -20).
]

{ #category : 'tests' }
WormHoleTest >> testWhenWeAreNotInAWormHolePositionThenTheDiceDontChange [ 
	| aPositionY aPositionZ wormhole myActualPosition result |
	aPositionY:=10.
	aPositionZ:=20.
	myActualPosition:= 50.
	wormhole:= WormHole at:aPositionY and: aPositionZ.
	
	result:= wormhole applyWormEffectTo: myActualPosition.
	self assert:(result = 0).
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
