"
clase GameBoard, se encarga de conocer la posicion de las naves y de moverlas segun corresponda
"
Class {
	#name : 'GameBoard',
	#superclass : 'Object',
	#instVars : [
		'squares',
		'wormhole',
		'effects'
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
	| newPosition obstacleAtPosition effect |
	
	"Primero avanza la nave con el dado"
	ship advance: adiceThrow.
	ship spendfuel:adiceThrow.
	newPosition := ship position.
	"Busca si hay un obstáculo en la posición actual"
	obstacleAtPosition := effects detect: [:obs | obs validatePosition: newPosition] ifNone: [nil].


	obstacleAtPosition ifNotNil: [
		effect := obstacleAtPosition applyEffectTo: ship.
		ship advance: effect.
		ship spendfuel: effect abs.
	].

	ship advanceTurn.
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
	effects:= aCollectionOfEffects .
]
