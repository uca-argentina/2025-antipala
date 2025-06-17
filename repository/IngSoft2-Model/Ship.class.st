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
		'maxAmountOfFuel'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'operations' }
Ship class >> create: id [
	^ (self new) initializeWith: id .
]

{ #category : 'operations' }
Ship class >> create: id with: aMaxAmountOfFuel [
	^ (self new) initializeWith: id and: aMaxAmountOfFuel.
]

{ #category : 'accessing' }
Ship >> advance: positions [

	self
		deprecated: 'Use advance:withBoardSize: instead of current one'
		on: '16 June 2025'
		in:
		'Pharo-12.0.0+SNAPSHOT.build.1571.sha.cf5fcd22e66957962c97dffc58b0393b7f368147 (64 Bit)'.
	position := position + positions
]

{ #category : 'accessing' }
Ship >> advance: positions withBoardSize: boardSize [

	laps := laps + ((position + positions) // boardSize).
   	position := (position + positions) \\ boardSize.
    

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
	maxAmountOfFuel:=100.
	hyperGravityStatus:=0.
]

{ #category : 'initialization' }
Ship >> initializeWith: aId and: aMaxAmountOfFuel [

	position := 0.
	id := aId.
	turn := 0.
	laps := 0.
	fuel := aMaxAmountOfFuel.
	maxAmountOfFuel:=aMaxAmountOfFuel.
	hyperGravityStatus:=0.
]

{ #category : 'accessing' }
Ship >> isInLap: aLap [
	^laps = aLap .

]

{ #category : 'accessing' }
Ship >> isInPosition: aPosition [
	^position = aPosition .

]

{ #category : 'testing' }
Ship >> isWithFuel: aFuelNumber [ 
	^fuel = aFuelNumber .
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
	fuel:=maxAmountOfFuel.
]

{ #category : 'as yet unclassified' }
Ship >> refundFuel: quantity [ 
	fuel := fuel + quantity.
]

{ #category : 'accessing' }
Ship >> returnLap [

	laps := laps > 0
		        ifTrue: [ laps - 1 ]
		        ifFalse: [ 0 ]
]

{ #category : 'accessing' }
Ship >> setPosition:unNumero [
		position:=unNumero.
]

{ #category : 'as yet unclassified' }
Ship >> setfuel:adicemax [
	maxAmountOfFuel:=2*adicemax.
	fuel:=maxAmountOfFuel.
	
]

{ #category : 'as yet unclassified' }
Ship >> spendfuelby: aFuelamoutspend [

	fuel := (fuel - aFuelamoutspend) max: 0
]

{ #category : 'as yet unclassified' }
Ship >> turn [
	^turn.
]
