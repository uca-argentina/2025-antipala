"
clase GameBoard, se encarga de conocer los el tablero, las naves y de moverlas segun corresponda
"
Class {
	#name : 'GameBoard',
	#superclass : 'Object',
	#instVars : [
		'squares',
		'effectManager'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
GameBoard class >> with: numberOfSquares including: anEffectManager [ 
	^ self new with: numberOfSquares including: anEffectManager.
]

{ #category : 'accessing' }
GameBoard >> move: ship with: adiceThrow [ 
	| turnContinues |
	
	turnContinues := effectManager handleEffectsFor: ship withThrow: adiceThrow maxSquares: squares.

	turnContinues ifFalse: [ ^nil ].

	ship advanceTurn.

	"
	Antes de refactorizar la logica de vueltas dentro de nave se necesitaba este codigo
	(ship position >= squares) ifTrue: [
		ship advance: 0 - squares.
		ship advanceLap.
	].
	(ship position < 0 and: ship laps >0) ifTrue: [
		ship advance:squares.
		ship returnLap .
	]."

	^self

]

{ #category : 'accessing' }
GameBoard >> squares [

	^ squares
]

{ #category : 'as yet unclassified' }
GameBoard >> with: numberOfSquares including: anEffectManager [
   squares := numberOfSquares.
	effectManager := anEffectManager.
]
