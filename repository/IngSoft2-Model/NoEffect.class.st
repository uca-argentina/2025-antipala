"
Clase NoEffect. Efecto generico que tiene cualquier casillero, no modifica la posicion de la nave que aterriza en el. (Ver si vale la pena hacerlo singleton)
"
Class {
	#name : 'NoEffect',
	#superclass : 'Effect',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'creation' }
NoEffect class >> at: position [

	^ self new initializeWith: position
]

{ #category : 'method' }
NoEffect >> applyEffectTo: ship with: effectManager [

	^ self
]

{ #category : 'method' }
NoEffect >> forceApplyTo: aShip with: effectManager [

	^ self
]

{ #category : 'initialize' }
NoEffect >> initializeWith: position [

	effectPosition := position
]
