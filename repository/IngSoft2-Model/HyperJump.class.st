"
Clase HyperJump. Efecto positivo, el cual hace avanzar a la nave que aterrizo una cierta cantidad de parsecs (para esto ahora el tablero esta definido en parsecs, no en casilleros). Cada nave que aterriza recive un efecto distinto (No siempre es la misma cantidad de parsecs) de forma secuencial.
"
Class {
	#name : 'HyperJump',
	#superclass : 'Effect',
	#instVars : [
		'jumpList',
		'currentJumpIndex'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'creation' }
HyperJump class >> createWith: aListOfJumps [

	^ self new initializeWith: aListOfJumps
]

{ #category : 'method' }
HyperJump >> applyEffectTo: aShip with: anEffectManager [

	anEffectManager move: aShip by: (jumpList at: currentJumpIndex).

	currentJumpIndex := currentJumpIndex = jumpList size
		                ifTrue: [ 1 ]
		                ifFalse: [ currentJumpIndex + 1 ]
]

{ #category : 'initialize' }
HyperJump >> convertToParsec: aList [

	^ aList * 0.5
]

{ #category : 'initialize' }
HyperJump >> initializeWith: aListOfJumps [

	jumpList := self convertToParsec: (aListOfJumps sort: [ :jumpA :jumpB | jumpA > jumpB ]).
	currentJumpIndex := 1
]
