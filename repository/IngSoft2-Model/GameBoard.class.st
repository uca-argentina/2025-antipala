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

{ #category : 'as yet unclassified' }
GameBoard >> activateHyperGravity: aShip with: anObstacle [
			aShip settheLastEffect: anObstacle.
			aShip changeHyperGravityStatus: 1.
			^ nil
]

{ #category : 'as yet unclassified' }
GameBoard >> applyEffectIfNeeded: anEffect to: aShip [
|effect|
anEffect ifNotNil: [
	(anEffect isKindOf: HyperGravity) ifTrue: [self activateHyperGravity: aShip with: anEffect ].
	effect := anEffect applyEffectTo: aShip.
	effect ifNotNil: [
		aShip advance: effect.
		aShip spendfuel: effect abs ] ].
]

{ #category : 'as yet unclassified' }
GameBoard >> effectAtPosition: aPosition [
^effects detect: [ :obs | obs validatePosition: aPosition ]ifNone: [ nil ].
]

{ #category : 'accessing' }
GameBoard >> hasCrossedTheGoal: ship [

	ship position >= squares ifFalse: [ ^ self ]. "Verifica si cruzó la meta"
	ship advance: 0 - squares.
	ship advanceLap
]

{ #category : 'asserting' }
GameBoard >> hyperGravityCheck: ship with: aDiceThrow [
	(ship hyperGravityStatus = 1 and: (ship theLastEffect isKindOf: HyperGravity)) ifFalse: [ ^false ].

	(ship theLastEffect validateCondition: aDiceThrow)
		ifTrue: [
			ship changeHyperGravityStatus: 0.
		].
^true.
]

{ #category : 'accessing' }
GameBoard >> move: ship with: adiceThrow [

	| newPosition obstacleAtPosition |
	(self hyperGravityCheck: ship with: adiceThrow) ifTrue: [ ^ nil ].
	
	ship advance: adiceThrow.
	ship spendfuel: adiceThrow.
	newPosition := ship position.
	
	newPosition >= squares ifTrue: [
	newPosition := newPosition - squares ].

	obstacleAtPosition := self effectAtPosition: newPosition.
	self applyEffectIfNeeded: obstacleAtPosition to: ship. 
	ship advanceTurn.
	self hasCrossedTheGoal: ship
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
