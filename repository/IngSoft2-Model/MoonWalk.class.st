"
Clase MoonWalk. Efecto positivo, en el cual la nave que aterriza aqui no se ve afectada, pero haciendo retroceder al resto de naves un numero de casilleros (walk) definido al inicializar cada MoonWalk.
"
Class {
	#name : 'MoonWalk',
	#superclass : 'Effect',
	#instVars : [
		'walk'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
MoonWalk class >> at: position and: walk [

	^ self new initializeWith: position and: walk
]

{ #category : 'as yet unclassified' }
MoonWalk class >> effectProbability [

	^ 0.1

]

{ #category : 'method' }
MoonWalk >> applyEffectTo: ship with: effectManager [

	effectManager moveAllShipsExcept: ship by: walk.
]

{ #category : 'initialize' }
MoonWalk >> initializeWith: position and: aWalk [

	effectPosition := position.
	walk := aWalk negated
]
