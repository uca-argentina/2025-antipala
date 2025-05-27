Class {
	#name : 'HyperGravity',
	#superclass : 'Object',
	#instVars : [
		'hyperGravityPosition',
		'hyperGravityXValue'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'accessing' }
HyperGravity class >> atPosition: aPosition withValue: xValue [ 
	^ self new initializeWith: aPosition and: xValue.
]

{ #category : 'as yet unclassified' }
HyperGravity >> applyEffectTo: aShip [
^0.
]

{ #category : 'initialization' }
HyperGravity >> initializeWith: aPosition and: aXvalue [ 
	hyperGravityPosition:=aPosition.
	hyperGravityXValue:= aXvalue.
]

{ #category : 'method' }
HyperGravity >> validatePosition: aPosition [
	^hyperGravityPosition==aPosition.
]
