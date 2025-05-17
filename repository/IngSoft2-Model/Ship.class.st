"
Clase Ship.
se encarga de saber su propia posicion y poder cambiarla segun lo que le indique el GameBoard
"
Class {
	#name : 'Ship',
	#superclass : 'Object',
	#instVars : [
		'position',
		'id'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'operations' }
Ship class >> create: id [
	^ (self new) initializeWith: id .
]

{ #category : 'accessing' }
Ship >> advance: throw [
	position:= position + throw.
]

{ #category : 'initialization' }
Ship >> getId [
   ^id.
]

{ #category : 'initialization' }
Ship >> initializeWith: aId [ 
   position := 0.
	id:= aId.
]

{ #category : 'accessing' }
Ship >> moveTo: newposition [
	position := newposition.
]

{ #category : 'accessing' }
Ship >> position [
	^position
]
