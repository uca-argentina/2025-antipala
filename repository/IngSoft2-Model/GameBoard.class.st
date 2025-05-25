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
	| currentPosition newPosition obstacleAtPosition effect |

	currentPosition := ship position.

	"Verifica si hay un efecto en la POSICIÓN ACTUAL (ej. HyperGravity)"
	obstacleAtPosition := effects
		detect: [:obs | obs validatePosition: currentPosition]
		ifNone: [nil].

	(obstacleAtPosition respondsTo: #applyEffectTo:withThrow:) ifTrue: [
		effect := obstacleAtPosition applyEffectTo: ship withThrow: adiceThrow.
		effect = 0 ifTrue: [ ^0 ] "Si el efecto no permite moverse, se cancela el turno"
	].

	"Avanza normalmente"
	ship advance: adiceThrow.
	ship spendfuel: adiceThrow.

	"Calcula nueva posición con wrap-around"
	newPosition := ship position.
	newPosition >= squares ifTrue: [ newPosition := newPosition - squares ].

	"Verifica si hay un efecto en la NUEVA posición"
	obstacleAtPosition := effects
		detect: [:obs | obs validatePosition: newPosition]
		ifNone: [nil].

	obstacleAtPosition ifNotNil: [
		effect := (obstacleAtPosition respondsTo: #applyEffectTo:withThrow:)
			ifTrue: [ obstacleAtPosition applyEffectTo: ship withThrow: adiceThrow ]
			ifFalse: [ obstacleAtPosition applyEffectTo: ship ].
		ship advance: effect.
		ship spendfuel: effect abs.
	].

	"Turno y vuelta"
	ship advanceTurn.
	ship position >= squares ifFalse: [ ^ self ].
	ship advance: 0 - squares.
	ship advanceLap.

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
