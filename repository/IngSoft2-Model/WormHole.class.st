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
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'creation' }
WormHole class >> at: positionY and: positionZ [

	^ self new initializeWith: positionY and: positionZ
]

{ #category : 'method' }
WormHole >> applyEffectTo: aShip with: anEffectManager [
	
	| displacement |
	(self shouldApplyTo: aShip) ifFalse: [ ^ self ].
	displacement := 0.
	(aShip isAt: positionY) ifTrue: [
		displacement := positionZ - positionY ].

	(aShip isAt: positionZ) ifTrue: [
		displacement := positionY - positionZ ].

	anEffectManager move: aShip by: displacement
]

{ #category : 'method' }
WormHole >> forceApplyTo: aShip with: anEffectManager [

	| displacement |
	displacement := 0.
	(aShip isAt: positionY) ifTrue: [
		displacement := positionZ - positionY ].

	(aShip isAt: positionZ) ifTrue: [
		displacement := positionY - positionZ ].

	anEffectManager move: aShip by: displacement
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
