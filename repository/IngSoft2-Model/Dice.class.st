Class {
	#name : 'Dice',
	#superclass : 'Object',
	#instVars : [
		'face'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Dice class >> aMinimumLengthIsInvalid: aFace [
    (aFace < 2) ifTrue: [
        Error signal: 'the dice must have at least 2 faces.'
    ].
]

{ #category : 'as yet unclassified' }
Dice class >> withFace:aFace [

self aMinimumLengthIsInvalid: aFace.
^(self new) initializeDiceWith:aFace.
]

{ #category : 'as yet unclassified' }
Dice >> initializeDiceWith:aFace [
face:=aFace.


]

{ #category : 'as yet unclassified' }
Dice >> roll [
^ (1 to: face ) atRandom.


]
