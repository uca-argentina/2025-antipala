Class {
	#name : 'HyperGravity',
	#superclass : 'Object',
	#instVars : [
		'hypergravitySquare',
		'hypergravityXValue'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'accessing' }
HyperGravity class >> at: aPosition withXValue: aNumber [ 
	^ self new at: aPosition withXValue: aNumber.
]

{ #category : 'as yet unclassified' }
HyperGravity >> applyEffectTo: aShip [
	| effect |
	effect := -4.
	aShip advance: effect.
	aShip spendfuel: effect abs.
]

{ #category : 'accessing' }
HyperGravity >> at: aPosition withXValue: aNumber [ 
	hypergravitySquare:=aPosition.
	hypergravityXValue:= aNumber.
]

{ #category : 'method' }
HyperGravity >> validatePosition: aPosition [ 
	^(hypergravitySquare == aPosition).
]
