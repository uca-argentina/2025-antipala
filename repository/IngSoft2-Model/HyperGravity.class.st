Class {
	#name : 'HyperGravity',
	#superclass : 'Object',
	#instVars : [
		'positionY',
		'positionZ',
		'effectposition'
	],
	#classInstVars : [
		'positionY'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
HyperGravity class >> at: arg1 [

	^ self new initializeWith: arg1
]

{ #category : 'as yet unclassified' }
HyperGravity >> applyEffectTo: aShip [

]

{ #category : 'as yet unclassified' }
HyperGravity >> initializeWith: arg1 [

	effectposition := arg1
]

{ #category : 'method' }
HyperGravity >> validatePosition: aPosition [ 
	^(effectposition == aPosition).
]
