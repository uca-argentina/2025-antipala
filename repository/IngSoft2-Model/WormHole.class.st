"
Clase WormHole. Efecto en el cual si una nave aterriza en su posicion Y, esta se desplaza a su posicion Z.
"
Class {
	#name : 'WormHole',
	#superclass : 'Effect',
	#instVars : [
		'positionY',
		'positionZ'
	],
	#classInstVars : [
		'positionY'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
WormHole class >> at: start and: finish [

	^ self new initializeWith: start and: finish
]

{ #category : 'as yet unclassified' }
WormHole class >> effectProbability [

	^ 0
]

{ #category : 'method' }
WormHole >> applyEffectTo: aShip with: anEffectManager [

	| originalPosition |
	originalPosition := aShip position.
	(originalPosition = positionY) ifTrue: [
		anEffectManager move: aShip by: positionZ - positionY ].

	(originalPosition = positionZ) ifTrue: [
		anEffectManager move: aShip by: positionY - positionZ ]
]

{ #category : 'initialize' }
WormHole >> initializeWith: aPositionY and: aPositionZ [
	aPositionY negative ifTrue: [ Error signal: 'The WormHole Position can not be negative' ].
	aPositionZ negative ifTrue: [ Error signal: 'The WormHole Position can not be negative' ].
	positionY:=aPositionY.
	positionZ:=aPositionZ.
]

{ #category : 'method' }
WormHole >> shouldApplyTo: aShip [

	^ (aShip isAt: positionY) or: (aShip isAt: positionZ)
]
