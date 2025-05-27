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
		'lastEffect'
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

(ship hyperGravityStatus = 1) ifTrue: [
	(lastEffect isKindOf: HyperGravity) ifTrue: [
		(lastEffect validateCondition: adiceThrow)
			ifTrue: [
				ship changeHyperGravityStatus: 0.
				^nil
			]
			ifFalse: [
				^nil.
				Transcript show: 'La condición de hipergravedad no se cumplió'; cr.
			].
	].
].

	"Avanza la nave y gasta combustible"
	ship advance: adiceThrow.
	ship spendfuel: adiceThrow.
	newPosition := ship position.
	newPosition >= squares ifTrue: [ newPosition := newPosition - squares ].

	"Busca si hay un efecto en esa posición"
	obstacleAtPosition := effects
		detect: [ :obs | obs validatePosition: newPosition ]
		ifNone: [ nil ].
		
	obstacleAtPosition ifNotNil: [

		(obstacleAtPosition isKindOf: HyperGravity) ifTrue: [
			lastEffect:=obstacleAtPosition.
			Transcript show: 'Entró al HyperGravity por primera vez'; cr.
			ship changeHyperGravityStatus: 1.
			^nil.
		].
		"Aplicar el efecto si no es HyperGravity"
		effect := obstacleAtPosition applyEffectTo: ship.
		effect ifNotNil: [
			ship advance: effect.
			ship spendfuel: effect abs.
		].
	].

	"Avanza el turno"
	ship advanceTurn.

	"Verifica si cruzó la meta"
	ship position >= squares ifFalse: [ ^self ].
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
	lastEffect:=nil.
]
