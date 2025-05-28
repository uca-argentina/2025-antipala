Class {
	#name : 'HyperJump',
	#superclass : 'Effect',
	#instVars : [
		'effectposition',
		'squares',
		'parsecs',
		'currentIndex'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
HyperJump class >> at: positions and: totalSquares [

	^ self new initializeWith: positions and: totalSquares
]

{ #category : 'as yet unclassified' }
HyperJump >> applyEffectTo: aShip [

	| percentage jumpSquares |
    
    percentage := parsecs at: currentIndex.
    
    "Avanza el índice cíclicamente"
    currentIndex := currentIndex = parsecs size
        ifTrue: [ 1 ]
        ifFalse: [ currentIndex + 1 ].
    
    jumpSquares := ((percentage / 100) * squares ) rounded.

    ^ jumpSquares
]

{ #category : 'as yet unclassified' }
HyperJump >> initializeWith: position and: totalSquares [

	parsecs := #( 15 10 5 ).
	effectposition := position.
	squares := totalSquares.
	currentIndex := 1.
]

{ #category : 'as yet unclassified' }
HyperJump >> validatePosition: aPosition [ 
	^(effectposition == aPosition).
]
