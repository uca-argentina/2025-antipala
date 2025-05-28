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
		'die'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
GameBoard class >> testBoardWith: numberOfSquares in: aGame [

	^ self new testBoardWith: numberOfSquares in: aGame
]

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

{ #category : 'testing' }
GameBoard >> createWeightedEffectList [
	| effectClasses weightedList |
	effectClasses := { 
		BlackHole. HyperGravity. MoonWalk. HyperJump. AtomicBomb. NoEffect 
	}.
	weightedList := OrderedCollection new.

	effectClasses do: [:class |
		1 to: class effectProbability do: [ :i |
			weightedList add: class ].
	].

	^ weightedList
	
"es una lista con: 
40 casilleros sin nada, 
2 con atomic bomb, 
20 blackholes,..."
]

{ #category : 'as yet unclassified' }
GameBoard >> effectAtPosition: aPosition [
^effects detect: [ :obs | obs validatePosition: aPosition ]ifNone: [ nil ].
]

{ #category : 'testing' }
GameBoard >> generateEffectsForBoard [
	| effectClasses counts indexList random pos effect|
	effectClasses := { 
		BlackHole. HyperGravity. MoonWalk. HyperJump. AtomicBomb. NoEffect 
	}.
	effects := OrderedCollection new. "reinicia los efectos actuales"
	random := Random new.

	"1. Calcular la cantidad de casilleros para cada efecto según su %"
	counts := effectClasses collect: [:class |
		(squares * class effectProbability / 100) rounded
	].

	"2. Generar una lista de posiciones disponibles"
	indexList := (1 to: squares ) asOrderedCollection.

	"3. Asignar efectos aleatoriamente a las posiciones"
	effectClasses with: counts do: [:class :count |
		1 to: count do: [:i |
			indexList isEmpty ifTrue: [^ effects]. "Por si rounding excede"
			pos := indexList removeAt: (random nextInt: indexList size) + 1.
			class = NoEffect
				ifFalse: [
					effect := self instantiateEffect: class at: pos.
					effects add: effect
				].
		].
	].


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

{ #category : 'testing' }
GameBoard >> testBoardWith: numberOfSquares in: aGame [

	squares := numberOfSquares.
	effects := OrderedCollection new.
	lastEffect := nil.
	die := ChargeDice create.
	effects add: (HyperJump at: die rollGameBoard and: numberOfSquares).
	effects add: (HyperGravity atPosition: die withValue: 2).
	effects add: (MoonWalk at: die and: aGame ships and: 1).
	effects add: (AtomicBomb at: die rollGameBoard and: numberOfSquares).
	effects add: (BlackHole at: die).
]

{ #category : 'accessing' }
GameBoard >> with: numberOfSquares and: aWormhole [
	numberOfSquares >3 ifFalse: [ Error signal: 'The number of squares should be more than 3' ].
	squares := numberOfSquares.
	wormhole:= aWormhole .
]

{ #category : 'accessing' }
GameBoard >> with: numberOfSquares including: aCollectionOfEffects [
	squares := numberOfSquares.
	effects:= aCollectionOfEffects .
	lastEffect:=nil.
]
