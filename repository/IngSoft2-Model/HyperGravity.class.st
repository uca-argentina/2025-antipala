"
Clase HyperGravity. Efecto negativo, en el cual la nave que aterriza debe obtener una tirada mayor a la dicha en este efecto para poder avanzar, caso contrario la nave pierde el turno y debe volver a lanzar en su siguiente turno para intentar seguir avanzando.
"
Class {
	#name : 'HyperGravity',
	#superclass : 'Effect',
	#instVars : [
		'hyperGravityPosition',
		'hyperGravityXValue',
		'hyperGravityStatus',
		'listInHyperGravityShips'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'accessing' }
HyperGravity class >> atPosition: aPosition withValue: xValue [ 
	^ self new initializeWith: aPosition and: xValue.
]

{ #category : 'accessing' }
HyperGravity class >> effectProbability [

	^ 0.2
]

{ #category : 'as yet unclassified' }
HyperGravity >> applyEffectTo: aShip [
	| hasFallenInHyperGravityBefore |
	hasFallenInHyperGravityBefore:= listInHyperGravityShips anySatisfy: [:each | each == aShip ] .
]

{ #category : 'initialization' }
HyperGravity >> initializeWith: aPosition and: aXvalue [ 
	hyperGravityPosition:=aPosition.
	hyperGravityXValue:= aXvalue.
	listInHyperGravityShips:= OrderedCollection new.
]
