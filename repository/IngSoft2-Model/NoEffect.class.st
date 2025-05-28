Class {
	#name : 'NoEffect',
	#superclass : 'Object',
	#instVars : [
		'effectposition',
		'squares',
		'parsecs',
		'currentIndex'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
NoEffect class >> at: position [

	^ self new initializeWith: position
]

{ #category : 'as yet unclassified' }
NoEffect class >> with: context at: position [

	^ self new initializeWith: context at: position
]

{ #category : 'as yet unclassified' }
NoEffect >> applyEffectTo: aShip [

	^ 0
]

{ #category : 'as yet unclassified' }
NoEffect >> effectProbability [

	^ 40
]

{ #category : 'initialization' }
NoEffect >> initializeWith: position [
	effectposition := position.
]

{ #category : 'method' }
NoEffect >> validatePosition: aPosition [ 
	^(effectposition == aPosition).
]
