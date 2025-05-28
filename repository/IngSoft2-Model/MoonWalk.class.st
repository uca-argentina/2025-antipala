Class {
	#name : 'MoonWalk',
	#superclass : 'Effect',
	#instVars : [
		'effectposition',
		'ships',
		'walk'
	],
	#classInstVars : [
		'positionY'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
MoonWalk class >> at: position and: aCollectionOfShips and: n [

	^ self new initializeWith: position and: aCollectionOfShips and: n

]

{ #category : 'as yet unclassified' }
MoonWalk >> applyEffectTo: aShip [

	(ships select: [ :ship | ship ~= aShip ]) do: [ :ship |
		ship advance: 0-walk ].

	^ 0
]

{ #category : 'as yet unclassified' }
MoonWalk >> initializeWith: position and: aCollectionOfShips and: n [

	effectposition := position.
	ships := aCollectionOfShips.
	walk := n.
]

{ #category : 'method' }
MoonWalk >> validatePosition: aPosition [ 
	^(effectposition == aPosition).
]
