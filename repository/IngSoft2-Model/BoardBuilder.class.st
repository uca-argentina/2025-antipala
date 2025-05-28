Class {
	#name : 'BoardBuilder',
	#superclass : 'Object',
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

	| aCollectionOfEffects generadores  generator r acumulado selector |
	aCollectionOfEffects := OrderedCollection new.



	generadores := {
	{#generateAtomicBomb:. AtomicBomb effectProbability }.
	{#generateBlackHole:. BlackHole effectProbability }.
	{#generateHyperJump:. HyperJump effectProbability }.
	{ #generateHyperGravity:. HyperGravity effectProbability }.
	{#generateMoonWalk:. MoonWalk effectProbability }.
	{#generateNoEffect:. NoEffect effectProbability } }.

	generator := Random new.
	generator seed: 10.

	1 to: squares do: [ :i |
		r := generator next .
		acumulado := 0.
		selector := (generadores detect: [ :g |
			             acumulado := acumulado + g second.
			             r <= acumulado ]) first.

		"Genera el efecto usando perform: con la posición actual"
		aCollectionOfEffects add: (self perform: selector with: i) ].




	^ GameBoard new with: squares including: aCollectionOfEffects
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
	^MoonWalk at: position and: ships and: throw
	
]

{ #category : 'as yet unclassified' }
BoardBuilder >> generateNoEffect: position [

	^ NoEffect at: position 
]

{ #category : 'as yet unclassified' }
BoardBuilder >> initAtomicBomb:aCollectionshit position:post [
	

	^AtomicBomb at:post and:aCollectionshit 
]

{ #category : 'as yet unclassified' }
BoardBuilder >> initializeWith: totalSquares and: setOfDices and: aCollectionOfShips [
	squares:= totalSquares .
	dices:= setOfDices .
	ships:= aCollectionOfShips .
	
]

{ #category : 'as yet unclassified' }
BoardBuilder >> randomBoard [
]
