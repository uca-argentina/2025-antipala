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
GameBoard class >> setSquares: numberOfSquares setWormhole: aWormHole [ 
	^ self new setSquares: numberOfSquares setWormhole: aWormHole.
]

{ #category : 'accessing' }
GameBoard >> move: ship with: diceThrow [ 
	ship advance: diceThrow.
	ship advance: (wormhole applyWormEffectTo: ship position).
]

{ #category : 'accessing' }
GameBoard >> setSquares: numberOfSquares setWormhole: awormhole [
	numberOfSquares >3 ifFalse: [ Error signal: 'The number of squares should be more than 3' ].
	squares := numberOfSquares.
	wormhole:= awormhole .
]
