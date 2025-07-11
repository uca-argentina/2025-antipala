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
MoonWalk class >> createWith: aWalk [
	aWalk<0 ifTrue: [ self error:'The MoonWalk value must be positive']. 
	^ self new initializeWith: aWalk
]

{ #category : 'method' }
MoonWalk >> applyEffectTo: aShip with: effectManager [
	
	effectManager moveAllShipsExcept: aShip by: walk
]

{ #category : 'initialize' }
MoonWalk >> initializeWith: aWalk [

	walk := aWalk negated 
]
