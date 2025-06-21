"
Clase AtomicBomb. Efecto que hace volver a cada nave a 1er posicion del tablero, sin gastar combustible, cuando una nave aterriza sobre el efecto.
"
Class {
	#name : 'AtomicBomb',
	#superclass : 'Effect',
	#instVars : [
		'atomicBombPosition'
	],
	#classInstVars : [
		'positionY'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'initialize' }
AtomicBomb class >> at: positions [ 

	^ self new initializeWith: positions
]

{ #category : 'as yet unclassified' }
AtomicBomb class >> effectProbability [

	^ 0.02
]

{ #category : 'as yet unclassified' }
AtomicBomb >> applyEffectTo: ship with: effectManager [
	
	effectManager triggerAtomicBomb
	
]

{ #category : 'as yet unclassified' }
AtomicBomb >> initializeWith: position [
	atomicBombPosition := position.
]

{ #category : 'as yet unclassified' }
AtomicBomb >> shouldApplyTo: aShip [

	^ aShip isAt: atomicBombPosition
]
