"
clase GameBoard, se encarga de conocer la posicion de las naves y de moverlas segun corresponda
"
Class {
	#name : 'GameBoard',
	#superclass : 'Object',
	#instVars : [
		'squares',
		'ships'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'initialization' }
GameBoard class >> setSquares: numberOfSquares setShips: collectionOfShips [ 
	^ self new setSquares: numberOfSquares setShips: collectionOfShips.
]

{ #category : 'accessing' }
GameBoard >> move: ship with: diceThrow [ 
	ship advance: diceThrow.
]

{ #category : 'accessing' }
GameBoard >> setSquares: numberOfSquares setShips: collectionOfShips [ 
	squares := numberOfSquares.
	ships := collectionOfShips.
]
