Class {
	#name : 'WormHoleTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
WormHoleTest >> testBanana [
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
