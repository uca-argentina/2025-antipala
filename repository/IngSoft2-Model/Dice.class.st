"
Clase Dice. Representa un dado, se puede crear con una cantidad arbitraria (Positiva) de caras. Cuando se tire generara un numero aleatoreo entre 1 y la cantidad de caras.
"
Class {
	#name : 'Dice',
	#superclass : 'Object',
	#instVars : [
		'faces'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'operations' }
Dice class >> validLength: aFace [
    (aFace < 2) ifTrue: [
        Error signal: 'the dice must have at least 2 faces.'
    ].
]

{ #category : 'creation' }
Dice class >> with:aFace [

self validLength: aFace.
^(self new) initializeDiceWith:aFace.
]

{ #category : 'initialize' }
Dice >> initializeDiceWith: maxFaces [
	maxFaces < 0 ifTrue: [self error: 'The number of faces of the dice must be positive'].
	faces := maxFaces
]

{ #category : 'method' }
Dice >> max [
^ faces.


]

{ #category : 'method' }
Dice >> roll [

	^ faces atRandom
]
