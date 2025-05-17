"
clase GameBoard, se encarga de conocer la posicion de las naves y de moverlas segun corresponda
"
Class {
	#name : 'GameBoard',
	#superclass : 'Object',
	#instVars : [
		'squares',
		'wormhole',
		'ships',
		'shipPlaying'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'initialization' }
GameBoard class >> with: numberOfSquares and: aWormHole [ 
	^ self new with: numberOfSquares and: aWormHole.
]

{ #category : 'initialization' }
GameBoard class >> with: numberOfSquares and: aWormHole and: numerOfShips [

	^ self new with: numberOfSquares and: aWormHole and: numerOfShips 
]

{ #category : 'accessing' }
GameBoard >> moveShip: steps [

	
	| oldPosition|
	oldPosition := ships at: shipPlaying at: 'position'. 
	
   
	ships at: shipPlaying at: 'position' put: oldPosition + steps + (wormhole applyWormEffectTo:(oldPosition + steps)).
	shipPlaying:= shipPlaying +1. 
	  
	
]

{ #category : 'accessing' }
GameBoard >> moveShipWithId: shipId by: steps [

	
	| oldPosition|
	oldPosition := ships at: shipPlaying at: 'position'. 
	
   
	ships at: shipId at: 'position' put: oldPosition + steps + (wormhole applyWormEffectTo:(oldPosition + steps)) . 
	  
	
]

{ #category : 'accessing' }
GameBoard >> positionOf: shipId [

	^ships at: shipId at: 'position'
]

{ #category : 'accessing' }
GameBoard >> squares [

	^ squares
]

{ #category : 'accessing' }
GameBoard >> with: numberOfSquares and: aWormhole and: numberOfShips [

	numberOfSquares > 3 ifFalse: [
		Error signal: 'The number of squares should be more than 3' ].
	squares := numberOfSquares.
	wormhole := aWormhole.
	ships := Dictionary new.
	shipPlaying:=1.
	1 to: numberOfShips do: [:id |
        ships at: id put: { 'position' -> 0. } asDictionary.
    ].
]
