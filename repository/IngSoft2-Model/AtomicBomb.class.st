Class {
	#name : 'AtomicBomb',
	#superclass : 'Object',
	#instVars : [
		'effectposition',
		'ships'
	],
	#classInstVars : [
		'positionY'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'initialize' }
AtomicBomb class >> at: positions and: aCollectionOfShips [

	^ self new initializeWith: positions and: aCollectionOfShips
]

{ #category : 'initialize' }
AtomicBomb class >> with: context at: position [

	^ self new initializeWith: context at: position 
]

{ #category : 'as yet unclassified' }
AtomicBomb >> applyEffectTo: actualShip [

	ships do: [ :aShip | aShip moveTo: 0 ].
	^0.
]

{ #category : 'as yet unclassified' }
AtomicBomb >> effectProbability [
	^2
]

{ #category : 'as yet unclassified' }
AtomicBomb >> initializeWith: position and: aCollectionOfShips [
	ships:= aCollectionOfShips.
	effectposition := position
]

{ #category : 'method' }
AtomicBomb >> validatePosition: aPosition [ 
	^(effectposition == aPosition).
]
