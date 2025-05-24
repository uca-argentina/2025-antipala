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

{ #category : 'initialization' }
GameBoard class >> with: numberOfSquares and: aWormHole and: numerOfShips [

	^ self new with: numberOfSquares and: aWormHole and: numerOfShips 
]

{ #category : 'accessing' }
GameBoard >> hasEnded [

	^ ships values anySatisfy: [ :shipData | (shipData at: 'position') >= squares ]

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
	ship position > squares ifFalse: [ ^ self ].
	ship advance: 0 - squares.
	ship advanceLap
]

{ #category : 'accessing' }
GameBoard >> moveShip: steps [

	| oldPosition |
	oldPosition := ships at: shipPlaying at: 'position'.

	self hasEnded ifTrue: [ Error signal: 'The game ended' ].

	ships at: shipPlaying at: 'position' put: oldPosition + steps
		+ (wormhole applyWormEffectTo: oldPosition + steps).

	self hasEnded ifFalse: [ shipPlaying := shipPlaying < ships size
		               ifTrue: [ shipPlaying + 1 ]
		               ifFalse: [ 1 ]]
]

{ #category : 'accessing' }
GameBoard >> positionOf: shipId [

	^ships at: shipId at: 'position'
]

{ #category : 'accessing' }
GameBoard >> shipPlaying [

	^ shipPlaying 
]

{ #category : 'accessing' }
GameBoard >> squares [

	^ squares
]

{ #category : 'accessing' }
GameBoard >> winner [

	self hasEnded ifTrue: [^ shipPlaying ].
	^nil.
]

{ #category : 'accessing' }
GameBoard >> with: numberOfSquares and: aWormhole [
	numberOfSquares >3 ifFalse: [ Error signal: 'The number of squares should be more than 3' ].
	squares := numberOfSquares.
	wormhole:= aWormhole .
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
