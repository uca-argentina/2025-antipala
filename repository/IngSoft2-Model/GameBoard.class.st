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
