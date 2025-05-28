Class {
	#name : 'HyperGravity',
	#superclass : 'Effect',
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
HyperGravity class >> effectProbability [

	^ 0.2
]

{ #category : 'as yet unclassified' }
HyperGravity >> applyEffectTo: aShip [
^0.
]

{ #category : 'accessing' }
HyperGravity >> hyperGravityStatus [

^hyperGravityStatus.
]

{ #category : 'initialization' }
HyperGravity >> initializeWith: aPosition and: aXvalue [ 
	hyperGravityPosition:=aPosition.
	hyperGravityXValue:= aXvalue.
	hyperGravityStatus:= 0. "0 significa que no esta activado"
]

{ #category : 'as yet unclassified' }
HyperGravity >> isHyperGravity [
    ^ true
]

{ #category : 'as yet unclassified' }
HyperGravity >> validateCondition: aThrowDice [
^aThrowDice>=hyperGravityXValue.
]

{ #category : 'as yet unclassified' }
HyperGravity >> validatePosition: aPosition [
	^hyperGravityPosition==aPosition.
]
