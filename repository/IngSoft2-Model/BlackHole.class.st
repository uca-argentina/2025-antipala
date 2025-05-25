Class {
	#name : 'BlackHole',
	#superclass : 'Object',
	#instVars : [
		'positionY',
		'positionZ',
		'blackholeposition'
	],
	#classInstVars : [
		'positionY'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
BlackHole class >> at: arg1 [

	^ self new initializeWith: arg1
]

{ #category : 'as yet unclassified' }
BlackHole >> applyEffectTo: aShip [
	| effect |
	effect := -4.
	aShip spendfuel: effect abs.
	^effect
]

{ #category : 'initialization' }
BlackHole >> initializeWith: arg1 [

	blackholeposition := arg1
]

{ #category : 'method' }
BlackHole >> validatePosition: aPosition [ 
	^(blackholeposition == aPosition).
]
