"
Clase NoEffect. Efecto generico que tiene cualquier casillero, no modifica la posicion de la nave que aterriza en el.
"
Class {
	#name : 'NoEffect',
	#superclass : 'Effect',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'creation' }
NoEffect class >> create [

	^ self new 
]

{ #category : 'method' }
NoEffect >> applyEffectTo: ship with: effectManager [

	^ self
]
