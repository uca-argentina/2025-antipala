Class {
	#name : 'HyperGravity',
	#superclass : 'Object',
	#instVars : [
		'hyperGravityPosition',
		'hyperGravityXValue',
		'hyperGravityStatus'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'accessing' }
HyperGravity class >> atPosition: aPosition withValue: xValue [ 
	^ self new initializeWith: aPosition and: xValue.
]

{ #category : 'accessing' }
HyperGravity class >> with: context at: position [

	^ self new initializeWith: context at: position 
]

{ #category : 'as yet unclassified' }
HyperGravity >> applyEffectTo: aShip [
^0.
]

{ #category : 'as yet unclassified' }
HyperGravity >> effectProbability [
	^20
]

{ #category : 'accessing' }
HyperGravity >> hyperGravityStatus [

^hyperGravityStatus.
]

{ #category : 'as yet unclassified' }
HyperGravity >> initializeWith: aPosition and: aXvalue [ 
	hyperGravityPosition:=aPosition.
	hyperGravityXValue:= aXvalue.
	hyperGravityStatus:= 0. "0 significa que no esta activado"
]

{ #category : 'as yet unclassified' }
HyperGravity >> validateCondition: aThrowDice [
^aThrowDice>=hyperGravityXValue.
]

{ #category : 'method' }
HyperGravity >> validatePosition: aPosition [
	^hyperGravityPosition==aPosition.
]
