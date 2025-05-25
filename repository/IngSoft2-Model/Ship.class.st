"
Clase Ship.
se encarga de saber su propia posicion y poder cambiarla segun lo que le indique el GameBoard
"
Class {
	#name : 'Ship',
	#superclass : 'Object',
	#instVars : [
		'position',
		'id',
		'turn',
		'fuel',
		'laps',
		'backupPosition'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'operations' }
Ship class >> create: id [
	^ (self new) initializeWith: id .
]

{ #category : 'accessing' }
Ship >> advance: positions [
	position := position + positions.

]

{ #category : 'accessing' }
Ship >> advanceLap [
	laps:= laps + 1.
]

{ #category : 'as yet unclassified' }
Ship >> advanceTurn [
	turn:=turn+1.
]

{ #category : 'accessing' }
Ship >> backupPosition: aPosition [

backupPosition:=aPosition.
]

{ #category : 'as yet unclassified' }
Ship >> fuel [
	^fuel.
]

{ #category : 'initialization' }
Ship >> getId [
   ^id.
]

{ #category : 'initialization' }
Ship >> initializeWith: aId [

	position := 0.
	id := aId.
	turn := 0.
	laps := 0.
	fuel := 100
]

{ #category : 'as yet unclassified' }
Ship >> laps [

	^ laps
]

{ #category : 'accessing' }
Ship >> moveTo: newposition [
	position := newposition.
]

{ #category : 'as yet unclassified' }
Ship >> myBackupPosition [
^backupPosition.
]

{ #category : 'accessing' }
Ship >> position [
	^position
]

{ #category : 'as yet unclassified' }
Ship >> refill [
	fuel:=100.
]

{ #category : 'accessing' }
Ship >> setPosition:unNumero [
		position:=unNumero.
]

{ #category : 'as yet unclassified' }
Ship >> setfuel:afuel [
	fuel:=afuel.
]

{ #category : 'as yet unclassified' }
Ship >> spendfuel:aFuelamoutspend [  
	fuel:=fuel-aFuelamoutspend.
]

{ #category : 'as yet unclassified' }
Ship >> turn [
	^turn.
]
