"
Clase Ship.
se encarga de saber su propia posicion y poder cambiarla segun lo que le indique el GameBoard
"
Class {
	#name : 'Ship',
	#superclass : 'Object',
	#instVars : [
		'position'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'operations' }
Ship class >> create [
	^ self new.
]

{ #category : 'accessing' }
Ship >> advance: positions [
	position := position + positions.
]

{ #category : 'initialization' }
Ship >> initialize [ 
    position := 0.
]

{ #category : 'accessing' }
Ship >> moveTo: newposition [
	position := newposition.
]

{ #category : 'accessing' }
Ship >> position [
	^position
]
