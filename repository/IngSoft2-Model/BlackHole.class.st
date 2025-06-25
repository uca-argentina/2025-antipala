"
Clase BlackHole. Efecto negativo, que hace retroceder 4 casilleros a la nave que aterrize en este efecto.
"
Class {
	#name : 'BlackHole',
	#superclass : 'Effect',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'creation' }
BlackHole class >> at: position [

	^ self new initializeWith: position
]

{ #category : 'method' }
BlackHole >> applyEffectTo: aShip with: anEffectManager [

	(self shouldApplyTo: aShip) ifFalse: [ ^ self ].
	anEffectManager move: aShip by: -4.
	anEffectManager putLastEffect: self.
]

{ #category : 'method' }
BlackHole >> forceApplyTo: aShip with: effectManager [

	effectManager move: aShip by: -4
]

{ #category : 'initialize' }
BlackHole >> initializeWith: position [

	effectPosition := position
]
