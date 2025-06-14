"
Clase HyperJump. Efecto positivo, el cual hace avanzar a la nave que aterrizo una cierta cantidad de parsecs (para esto ahora el tablero esta definido en parsecs, no en casilleros). Cada nave que aterriza recive un efecto distinto (No siempre es la misma cantidad de parsecs) de forma secuencial.
"
Class {
	#name : 'HyperJump',
	#superclass : 'Effect',
	#instVars : [
		'effectposition',
		'squares',
		'parsecs',
		'currentIndex'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
HyperJump class >> at: positions and: totalSquares [

	^ self new initializeWith: positions and: totalSquares
]

{ #category : 'as yet unclassified' }
HyperJump class >> effectProbability [

	^ 0.08
]

{ #category : 'as yet unclassified' }
HyperJump >> applyEffectTo: aShip [

	| percentage jumpSquares |
    
    percentage := parsecs at: currentIndex.
    
    "Avanza el índice cíclicamente"
    currentIndex := currentIndex = parsecs size
        ifTrue: [ 1 ]
        ifFalse: [ currentIndex + 1 ].
    
    jumpSquares := ((percentage / 100) * squares ) rounded.

    ^ jumpSquares
]

{ #category : 'as yet unclassified' }
HyperJump >> initializeWith: position and: totalSquares [

	parsecs := #( 15 10 5 ).
	effectposition := position.
	squares := totalSquares.
	currentIndex := 1.
]

{ #category : 'as yet unclassified' }
HyperJump >> validatePosition: aPosition [ 
	^(effectposition == aPosition).
]
