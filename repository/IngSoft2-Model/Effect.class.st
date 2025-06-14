"
Clase Effect. Effect es un casillero especial que modifica el comportamiento original de las naves que aterricen en estos casilleros.
"
Class {
	#name : 'Effect',
	#superclass : 'Object',
	#instVars : [
		'lenghtOfBoard'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'testing' }
Effect class >> effectProbability [

	^ 0 "subclassResponsibility"
]

{ #category : 'testing' }
Effect >> effectProbability [
	^ self class effectProbability
]

{ #category : 'testing' }
Effect >> isHyperGravity [
    ^ false
]

{ #category : 'testing' }
Effect >> setMaxSquares: maxLenght [
	lenghtOfBoard:=maxLenght 
]
