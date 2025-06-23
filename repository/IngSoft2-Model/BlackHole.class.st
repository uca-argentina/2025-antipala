"
Clase BlackHole. Efecto negativo, que hace retroceder 4 casilleros a la nave que aterrize en este efecto.
"
Class {
	#name : 'BlackHole',
	#superclass : 'Effect',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
BlackHole class >> at: position [

	^ self new initializeWith: position
]

{ #category : 'as yet unclassified' }
BlackHole class >> effectProbability [

	^ 0.2
]

{ #category : 'method' }
BlackHole >> applyEffectTo: aShip with: anEffectManager [

	anEffectManager move: aShip by: -4
]

{ #category : 'initialize' }
BlackHole >> initializeWith: position [

	effectPosition := position
]
