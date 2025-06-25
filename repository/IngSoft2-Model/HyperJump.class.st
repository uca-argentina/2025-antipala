"
Clase HyperJump. Efecto positivo, el cual hace avanzar a la nave que aterrizo una cierta cantidad de parsecs (para esto ahora el tablero esta definido en parsecs, no en casilleros). Cada nave que aterriza recive un efecto distinto (No siempre es la misma cantidad de parsecs) de forma secuencial.
"
Class {
	#name : 'HyperJump',
	#superclass : 'Effect',
	#instVars : [
		'parsecs',
		'currentIndex'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'creation' }
HyperJump class >> at: position with: aListOfJumps [

	^ self new initializeWith: position withJumps: aListOfJumps
]

{ #category : 'method' }
HyperJump >> applyEffectTo: aShip with: anEffectManager [

	(self shouldApplyTo: aShip) ifFalse: [ ^ self ].
	anEffectManager move: aShip by: (parsecs at: currentIndex).

	currentIndex := currentIndex = parsecs size
		                ifTrue: [ 1 ]
		                ifFalse: [ currentIndex + 1 ]
]

{ #category : 'initialize' }
HyperJump >> convertToParsec: aList [

	^ aList * 0.5
]

{ #category : 'method' }
HyperJump >> forceApplyTo: aShip with: anEffectManager [

	anEffectManager move: aShip by: (parsecs at: currentIndex).

	currentIndex := currentIndex = parsecs size
		                ifTrue: [ 1 ]
		                ifFalse: [ currentIndex + 1 ]
]

{ #category : 'initialize' }
HyperJump >> initializeWith: position withJumps: aList [

	parsecs := self convertToParsec: (aList sort: [ :a :b | a > b ]).
	effectPosition := position.
	currentIndex := 1
]
