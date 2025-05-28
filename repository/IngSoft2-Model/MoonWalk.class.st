Class {
	#name : 'MoonWalk',
	#superclass : 'Effect',
	#instVars : [
		'effectposition',
		'ships',
		'walk',
		'squares'
	],
	#classInstVars : [
		'positionY'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
MoonWalk class >> at: position and: aCollectionOfShips and: n and: boardLenght [

	^ self new initializeWith: position and: aCollectionOfShips and: n and: boardLenght

]

{ #category : 'as yet unclassified' }
MoonWalk class >> effectProbability [

	^ 0.1

]

{ #category : 'as yet unclassified' }
MoonWalk >> applyEffectTo: aShip [

	(ships select: [ :ship | ship ~= aShip ]) do: [
		:ship |
		ship advance: 0-walk.
		(ship position <0 and: ship laps >0) ifTrue: [
			ship advance: squares.
			ship returnLap ] .
		(ship laps == 0 and:ship position<0) ifTrue:  [ 
			ship setPosition:0 ]
		].

	^ 0
]

{ #category : 'as yet unclassified' }
MoonWalk >> initializeWith: position and: aCollectionOfShips and: n and: boardLenght [

	effectposition := position.
	ships := aCollectionOfShips.
	squares:=boardLenght .
	walk := n.
]

{ #category : 'as yet unclassified' }
MoonWalk >> validatePosition: aPosition [ 
	^(effectposition == aPosition).
]
