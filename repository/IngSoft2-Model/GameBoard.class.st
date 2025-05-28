"
clase GameBoard, se encarga de conocer la posicion de las naves y de moverlas segun corresponda
"
Class {
	#name : 'GameBoard',
	#superclass : 'Object',
	#instVars : [
		'squares',
		'wormhole',
		'effects',
		'lastEffect',
		'effectManager'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'accessing' }
GameBoard class >> with: numberOfSquares and: aWormHole [ 
	^ self new with: numberOfSquares and: aWormHole.
]

{ #category : 'as yet unclassified' }
GameBoard class >> with: numberOfSquares including: aCollectionOfEffects [ 
	^ self new with: numberOfSquares including: aCollectionOfEffects.
]

{ #category : 'accessing' }
GameBoard >> move: ship with: adiceThrow [ 
	| turnContinues |
	
	turnContinues := effectManager handleEffectsFor: ship withThrow: adiceThrow maxSquares: squares.

	turnContinues ifFalse: [ ^nil ].

	ship advanceTurn.

	(ship position >= squares) ifTrue: [
		ship advance: 0 - squares.
		ship advanceLap.
	].

	^self

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

{ #category : 'as yet unclassified' }
GameBoard >> with: numberOfSquares including: aCollectionOfEffects [
   squares := numberOfSquares.
	effects := aCollectionOfEffects.
	lastEffect := nil.
	effectManager := EffectManager new.
	effectManager effects: effects.
]
