"
clase GameBoard, se encarga de conocer la posicion de las naves y de moverlas segun corresponda
"
Class {
	#name : 'GameBoard',
	#superclass : 'Object',
	#instVars : [
		'squares',
		'wormhole'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'initialization' }
GameBoard class >> with: numberOfSquares and: aWormHole [ 
	^ self new with: numberOfSquares and: aWormHole.
]

{ #category : 'accessing' }
GameBoard >> move: ship with: adiceThrow [

	| test |
	ship advance: adiceThrow.
	ship advance: (wormhole applyWormEffectTo: ship position).
	test := wormhole applyWormEffectTo: ship position.
	ship spendfuel:
		adiceThrow + (wormhole applyWormEffectTo: ship position) abs.
	ship advanceTurn.
	ship position >= squares ifFalse: [ ^ self ].
	ship advance: 0 - squares.
	ship advanceLap
]

{ #category : 'accessing' }
GameBoard >> squares [

	^ squares
]

{ #category : 'accessing' }
GameBoard >> with: numberOfSquares and: aWormhole [
	numberOfSquares >3 ifFalse: [ Error signal: 'The number of squares should be more than 3' ].
	squares := numberOfSquares.
	wormhole:= aWormhole .
]
