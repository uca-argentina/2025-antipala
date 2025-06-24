"
Clase HyperGravity. Efecto negativo, en el cual la nave que aterriza debe obtener una tirada mayor a la dicha en este efecto para poder avanzar, caso contrario la nave pierde el turno y debe volver a lanzar en su siguiente turno para intentar seguir avanzando.
"
Class {
	#name : 'HyperGravity',
	#superclass : 'Effect',
	#instVars : [
		'hyperGravityXValue'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'creation' }
HyperGravity class >> at: position with: xValue [

	^ self new initializeWith: position and: xValue
]

{ #category : 'method' }
HyperGravity >> applyEffectTo: aShip with: anEffectManager [

	(self shouldApplyTo: aShip) ifFalse: [ ^ self ].
		anEffectManager
			handleHyperGravityCondition: hyperGravityXValue
			in: aShip 
]

{ #category : 'initialize' }
HyperGravity >> initializeWith: aPosition and: aXvalue [

	effectPosition := aPosition.
	hyperGravityXValue := aXvalue
]
