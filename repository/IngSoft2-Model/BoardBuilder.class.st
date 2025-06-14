"
Clase BoardBuilder. Es una clase que busca distribuir los efectos en cierta proporcion, creando un GameBoard.
"
Class {
	#name : 'BoardBuilder',
	#superclass : 'Object',
	#instVars : [
		'squares',
		'dices',
		'ships'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
BoardBuilder class >> with: totalSquares and: setOfDices and: aCollectionOfShips [

	^ self new
		  initializeWith: totalSquares
		  and: setOfDices
		  and: aCollectionOfShips
]

{ #category : 'as yet unclassified' }
BoardBuilder >> generateAtomicBomb: position [

	^AtomicBomb at: position and: ships
]

{ #category : 'as yet unclassified' }
BoardBuilder >> generateBlackHole: position [
	^BlackHole at: position
	
]

{ #category : 'as yet unclassified' }
BoardBuilder >> generateEffectsForBoard [
	| aCollectionOfEffects generadores generator r acumulado selector anEffectManager |
	aCollectionOfEffects := OrderedCollection new.

	generadores := {
		{ #generateAtomicBomb:. [ AtomicBomb effectProbability ] }.
		{ #generateBlackHole:. [ BlackHole effectProbability ] }.
		{ #generateHyperJump:. [ HyperJump effectProbability ] }.
		{ #generateHyperGravity:. [ HyperGravity effectProbability ] }.
		{ #generateMoonWalk:. [ MoonWalk effectProbability ] }.
		{ #generateNoEffect:. [ NoEffect effectProbability ] } }.

	generator := Random new.
	

	1 to: squares do: [ :i |
		r := generator next.
		acumulado := 0.
		selector := (generadores detect: [ :g |
			acumulado := acumulado + (g second value).
			r <= acumulado ]) first.

		aCollectionOfEffects add: (self perform: selector with: i) ].

	self seePercentage: aCollectionOfEffects.
	
	anEffectManager := EffectManager createWith: aCollectionOfEffects .

	^ GameBoard new with: squares including: anEffectManager

]

{ #category : 'as yet unclassified' }
BoardBuilder >> generateHyperGravity: position [
	| throw |
	throw := dices
		         inject: 0
		         into: [ :sum :eachDice | sum + eachDice roll ].
	^HyperGravity atPosition: position withValue: throw.
]

{ #category : 'as yet unclassified' }
BoardBuilder >> generateHyperJump: position [
	
	^ HyperJump at: position and: squares
]

{ #category : 'as yet unclassified' }
BoardBuilder >> generateMoonWalk: position [
	| throw |
	throw := dices
		         inject: 0
		         into: [ :sum :eachDice | sum + eachDice roll ].
	^MoonWalk at: position and: ships and: throw and: squares 
	
]

{ #category : 'as yet unclassified' }
BoardBuilder >> generateNoEffect: position [

	^ NoEffect at: position 
]

{ #category : 'as yet unclassified' }
BoardBuilder >> initializeWith: totalSquares and: setOfDices and: aCollectionOfShips [
	squares:= totalSquares .
	dices:= setOfDices .
	ships:= aCollectionOfShips .
	
]

{ #category : 'as yet unclassified' }
BoardBuilder >> seePercentage: effects [

	| counts total |
counts := Dictionary new.
effects do: [ :each |
    counts at: each class ifAbsentPut: [ 0 ].
    counts at: each class put: (counts at: each class) + 1 ].

total := effects size.

counts keysAndValuesDo: [ :class :count |
    | percentage rounded |
    percentage := count asFloat / total * 100.
    rounded := (percentage * 10) rounded / 10.0. "Redondea a 1 decimal"
    Transcript show: class name , ' -> ' , count asString , ' (' , rounded asString , '%)'; cr ].


]
