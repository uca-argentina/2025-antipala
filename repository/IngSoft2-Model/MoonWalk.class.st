"
Clase MoonWalk. Efecto positivo, en el cual la nave que aterriza aqui no se ve afectada, pero haciendo retroceder al resto de naves un numero de casilleros (walk) definido al inicializar cada MoonWalk.
"
Class {
	#name : 'MoonWalk',
	#superclass : 'Effect',
	#instVars : [
		'effectposition',
		'walk'
	],
	#classInstVars : [
		'positionY'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
MoonWalk class >> at: position and: n [

	^ self new
		  initializeWith: position
		  and: n
]

{ #category : 'as yet unclassified' }
MoonWalk class >> effectProbability [

	^ 0.1

]

{ #category : 'as yet unclassified' }
MoonWalk >> applyEffectTo: ship with: effectManager [

	effectManager moveAllShipsExcept: ship by: walk.
]

{ #category : 'initialization' }
MoonWalk >> initializeWith: position and: aWalk [

	effectposition := position.
	walk := aWalk negated.
]

{ #category : 'asserting' }
MoonWalk >> shouldApplyTo: aShip [

	^ aShip isAt: effectposition 
]
