Class {
	#name : 'AtomicBomb',
	#superclass : 'Effect',
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

{ #category : 'as yet unclassified' }
AtomicBomb >> applyEffectTo: actualShip [

	ships do: [ :aShip | aShip setPosition: 0 ].
	^0.
]

{ #category : 'as yet unclassified' }
AtomicBomb >> initializeWith: position and: aCollectionOfShips [
	ships:= aCollectionOfShips.
	effectposition := position
]

{ #category : 'as yet unclassified' }
AtomicBomb >> validatePosition: aPosition [ 
	^(effectposition == aPosition).
]
