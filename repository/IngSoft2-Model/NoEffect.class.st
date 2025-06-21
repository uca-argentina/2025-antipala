"
Clase NoEffect. Efecto generico que tiene cualquier casillero, no modifica la posicion de la nave que aterriza en el. (Ver si vale la pena hacerlo singleton)
"
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
NoEffect >> applyEffectTo: ship with: effectManager [

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
