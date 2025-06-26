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
BlackHole class >> create [

	^ self new
]

{ #category : 'method' }
BlackHole >> applyEffectTo: aShip with: anEffectManager [

	anEffectManager move: aShip by: -4.
	anEffectManager putLastEffect: self.
]
