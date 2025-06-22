"
Clase NoEffect. Efecto generico que tiene cualquier casillero, no modifica la posicion de la nave que aterriza en el. (Ver si vale la pena hacerlo singleton)
"
Class {
	#name : 'NoEffect',
	#superclass : 'Effect',
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

{ #category : 'method' }
NoEffect >> applyEffectTo: ship with: effectManager [

	^ nil
]

{ #category : 'initialize' }
NoEffect >> initializeWith: position [

	effectPosition := position
]
