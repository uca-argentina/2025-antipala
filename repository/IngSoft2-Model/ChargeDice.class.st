"
Clase ChargeDice. Representa un dado cargado que siempre genera un 5 cuando se tira.
"
Class {
	#name : 'ChargeDice',
	#superclass : 'Object',
	#instVars : [
		'values',
		'currentIndex'
	],
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'as yet unclassified' }
ChargeDice class >> createWith: aSetOfValues [
	^ self new initializeWith: aSetOfValues
]

{ #category : 'initialize' }
ChargeDice >> initializeWith: aSetOfValues [

	values := aSetOfValues.
	currentIndex := 0
]

{ #category : 'method' }
ChargeDice >> max [

	^ values max
]

{ #category : 'method' }
ChargeDice >> roll [

	currentIndex := currentIndex = values size
		                ifTrue: [ 1 ]
		                ifFalse: [ currentIndex + 1 ].

	^ values at: currentIndex.
]
