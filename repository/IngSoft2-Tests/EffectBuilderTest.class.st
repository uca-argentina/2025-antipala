Class {
	#name : 'EffectBuilderTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
EffectBuilderTest >> testEffectManagerShoudStartBuildingAWormHole [

	| builder effects chargeDice ship moveManager  aCollectionOfPositions  effectAtPosition |
	aCollectionOfPositions := { 5. 9. 7.} asOrderedCollection .
	chargeDice := ChargeDice createWith: #( 1 2 3 4 5 6 7 8 9 10 ).
	builder := EffectBuilder createWith: chargeDice and: aCollectionOfPositions.
	effects := builder build.
	ship := Ship
		        createWhithId: 1
		        andWithFuel: 1000
		        andwithlapmanager: (Lapmanager createWith: 100).
	moveManager := MoveManager new.
	
	moveManager move: ship by: 5.
	effectAtPosition := effects detect: [ :e | e shouldApplyTo: ship ].
	self assert: effectAtPosition class equals: WormHole .
	
	
	moveManager move: ship by: 2.
	effectAtPosition := effects detect: [ :e | e shouldApplyTo: ship ].
	self assert: effectAtPosition class equals: NoEffect .
	
	
	moveManager move: ship by: 2.
	effectAtPosition := effects detect: [ :e | e shouldApplyTo: ship ].
	self assert: effectAtPosition class equals: WormHole .
]
