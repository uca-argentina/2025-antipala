Class {
	#name : 'NoEffect',
	#superclass : 'Effect',
	#instVars : [
		'effectposition'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
NoEffect class >> at: positions [

	^ self new initializeWith: positions 
]

{ #category : 'as yet unclassified' }
NoEffect class >> effectProbability [

	^ 0.4
]

{ #category : 'as yet unclassified' }
NoEffect >> applyEffectTo: aShip [

	^0
]

{ #category : 'as yet unclassified' }
NoEffect >> initializeWith: position [
	effectposition := position.
]

{ #category : 'method' }
NoEffect >> validatePosition: aPosition [ 
	^(effectposition == aPosition).
]
