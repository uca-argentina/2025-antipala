"
Clase HyperJump. Efecto positivo, el cual hace avanzar a la nave que aterrizo una cierta cantidad de parsecs (para esto ahora el tablero esta definido en parsecs, no en casilleros). Cada nave que aterriza recive un efecto distinto (No siempre es la misma cantidad de parsecs) de forma secuencial.
"
Class {
	#name : 'HyperJump',
	#superclass : 'Effect',
	#instVars : [
		'parsecs',
		'currentIndex',
		'hyperJumpPosition'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
HyperJump class >> at: positions with: aListOfJumps [
	^ self new initializeWith: positions withJumps: aListOfJumps
]

{ #category : 'as yet unclassified' }
HyperJump class >> effectProbability [

	^ 0.08
]

{ #category : 'as yet unclassified' }
HyperJump >> applyEffectTo: aShip with: anEffectManager [

	| jumpSquares |
	jumpSquares := parsecs at: currentIndex.

	"Avanza el índice cíclicamente"
	currentIndex := currentIndex = parsecs size
		                ifTrue: [ 1 ]
		                ifFalse: [ currentIndex + 1 ].

	anEffectManager move:aShip by: jumpSquares.
]

{ #category : 'as yet unclassified' }
HyperJump >> initializeWith: position withJumps: aList [

	parsecs := aList sort: [:a :b | a > b].
	hyperJumpPosition := position.
	currentIndex := 1
]

{ #category : 'asserting' }
HyperJump >> shouldApplyTo: aShip [

	^ aShip isAt: hyperJumpPosition 
]
