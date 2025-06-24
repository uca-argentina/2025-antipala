"
Clase HyperGravity. Efecto negativo, en el cual la nave que aterriza debe obtener una tirada mayor a la dicha en este efecto para poder avanzar, caso contrario la nave pierde el turno y debe volver a lanzar en su siguiente turno para intentar seguir avanzando.
"
Class {
	#name : 'HyperGravity',
	#superclass : 'Effect',
	#instVars : [
		'hyperGravityXValue',
		'state',
		'effect'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'creation' }
HyperGravity class >> at: position with: xValue [

	^ self new initializeWith: position and: xValue
]

{ #category : 'creation' }
HyperGravity class >> createWith: hyperGravity and: hyperGravityXValue [ 
	^ self subclassResponsibility
]

{ #category : 'method' }
HyperGravity >> activateWith: anEffectManager on: aShip [ 
	^ self subclassResponsibility
]

{ #category : 'method' }
HyperGravity >> applyEffectTo: aShip with: anEffectManager [

	(self shouldApplyTo: aShip) ifFalse: [ ^ self ].
	state activateWith: anEffectManager on: aShip.
]

{ #category : 'method' }
HyperGravity >> changeState: aState [
	state := aState.
]

{ #category : 'initialize' }
HyperGravity >> initializeWith: aPosition and: aXvalue [
	aXvalue < 0 ifTrue: [self error: 'The Hypergravity X value must be positive'].
	aPosition < 0 ifTrue: [self error: 'The Hypergravity position must be positive'].
	effectPosition := aPosition.
	hyperGravityXValue := aXvalue.
	state := StateInactiveHyperGravity createWith: self and: hyperGravityXValue
]
