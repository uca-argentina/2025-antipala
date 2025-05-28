Class {
	#name : 'Dice',
	#superclass : 'Object',
	#instVars : [
		'face'
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

{ #category : 'initialize' }
Dice class >> with:aFace [

self validLength: aFace.
^(self new) initializeDiceWith:aFace.
]

{ #category : 'initialize' }
Dice >> initializeDiceWith:aFace [
face:=aFace.


]

{ #category : 'method' }
Dice >> max [
^ face.


]

{ #category : 'method' }
Dice >> roll [
^ (1 to: face ) atRandom.


]
