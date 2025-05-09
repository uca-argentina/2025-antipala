"
clase GameBoard, se encarga de conocer la posicion de las naves y de moverlas segun corresponda
"
Class {
	#name : 'GameBoard',
	#superclass : 'Object',
	#instVars : [
		'squares',
		'ships',
		'wormhole'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'initialization' }
GameBoard class >> setSquares: numberOfSquares setShips: collectionOfShips setWormhole: aWormHole [ 
	^ self new setSquares: numberOfSquares setShips: collectionOfShips setWormhole: aWormHole.
]

{ #category : 'accessing' }
GameBoard >> move: ship with: diceThrow [ 
	ship advance: diceThrow.
	ship advance: (wormhole applyWormEffectTo: ship position).
]

{ #category : 'accessing' }
GameBoard >> setSquares: numberOfSquares setShips: collectionOfShips setWormhole: awormhole [
	squares := numberOfSquares.
	ships := collectionOfShips.
	wormhole:= awormhole .
]
