"
Clase AtomicBomb. Efecto que hace volver a cada nave a 1er posicion del tablero, sin gastar combustible, cuando una nave aterriza sobre el efecto.
"
Class {
	#name : 'AtomicBomb',
	#superclass : 'Effect',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'creation' }
AtomicBomb class >> at: position [

	^ self new initializeWith: position
]

{ #category : 'method' }
AtomicBomb >> applyEffectTo: aShip with: effectManager [

	(self shouldApplyTo: aShip) ifFalse: [ ^ self ].
		effectManager triggerAtomicBomb 
]

{ #category : 'initialize' }
AtomicBomb >> initializeWith: position [

	effectPosition := position
]
