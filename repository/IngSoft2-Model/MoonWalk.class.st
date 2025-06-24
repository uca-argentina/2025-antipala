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

{ #category : 'creation' }
MoonWalk class >> at: position and: walk [

	^ self new initializeWith: position and: walk
]

{ #category : 'method' }
MoonWalk >> applyEffectTo: aShip with: effectManager [
	
	(self shouldApplyTo: aShip) ifFalse: [ ^ self ].
	effectManager moveAllShipsExcept: aShip by: walk
]

{ #category : 'initialize' }
MoonWalk >> initializeWith: position and: aWalk [
	position < 0 ifTrue: [self error: 'The MoonWalk position must be positive'].
	aWalk < 0 ifTrue: [self error: 'The MoonWalk walk must be positive'].
	effectPosition := position.
	walk := aWalk negated
]
