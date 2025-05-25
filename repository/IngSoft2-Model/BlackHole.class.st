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
	(aShip fuel>=effect abs)
		ifTrue: [
			aShip advance: effect.
			aShip spendfuel: effect abs
		]
		ifFalse: [
			aShip moveTo: (aShip myBackupPosition).
		].
]

{ #category : 'initialization' }
BlackHole >> initializeWith: arg1 [

	blackholeposition := arg1
]

{ #category : 'method' }
BlackHole >> validatePosition: aPosition [ 
	^(blackholeposition == aPosition).
]
