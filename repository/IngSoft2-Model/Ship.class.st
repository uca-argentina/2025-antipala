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
		'hyperGravityStatus',
		'maxAmount'
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

{ #category : 'as yet unclassified' }
Ship >> changeHyperGravityStatus: aValue [
Transcript show: 'Seteando hyperGravityStatus en: ', aValue printString ; cr.
hyperGravityStatus := aValue.
]

{ #category : 'as yet unclassified' }
Ship >> fuel [
	^fuel.
]

{ #category : 'initialization' }
Ship >> getId [
   ^id.
]

{ #category : 'accessing' }
Ship >> hyperGravityStatus [
^hyperGravityStatus.
]

{ #category : 'initialization' }
Ship >> initializeWith: aId [

	position := 0.
	id := aId.
	turn := 0.
	laps := 0.
	fuel := 100.
	maxAmount:=100.
	hyperGravityStatus:=0.
]

{ #category : 'as yet unclassified' }
Ship >> laps [

	^ laps
]

{ #category : 'accessing' }
Ship >> position [
	^position
]

{ #category : 'as yet unclassified' }
Ship >> refill [
	fuel:=maxAmount.
]

{ #category : 'as yet unclassified' }
Ship >> refundFuel: quantity [ 
	fuel := fuel + quantity.
]

{ #category : 'accessing' }
Ship >> setPosition:unNumero [
		position:=unNumero.
]

{ #category : 'as yet unclassified' }
Ship >> setfuel:adicemax [
	fuel:=maxAmount:=2*adicemax.
	maxAmount:=22*adicemax.
]

{ #category : 'as yet unclassified' }
Ship >> spendfuel:aFuelamoutspend [  
	fuel:=fuel-aFuelamoutspend.
]

{ #category : 'as yet unclassified' }
Ship >> turn [
	^turn.
]
