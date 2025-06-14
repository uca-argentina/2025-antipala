"
Clase BlackHole. Efecto negativo, que hace retroceder 4 casilleros a la nave que aterrize en este efecto.
"
Class {
	#name : 'BlackHole',
	#superclass : 'Effect',
	#instVars : [
		'blackholeposition'
	],
	#classInstVars : [
		'positionY'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
BlackHole class >> at: arg1 [

	^ self new initializeWith: arg1
]

{ #category : 'as yet unclassified' }
BlackHole class >> effectProbability [

	^ 0.2
]

{ #category : 'as yet unclassified' }
BlackHole >> applyEffectTo: aShip [
	| effect |
	effect := -4.
	aShip spendfuelby: effect abs.
	^effect
]

{ #category : 'as yet unclassified' }
BlackHole >> initializeWith: position [

	blackholeposition := position
]

{ #category : 'as yet unclassified' }
BlackHole >> validatePosition: aPosition [ 
	^(blackholeposition == aPosition).
]
