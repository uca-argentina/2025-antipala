Class {
	#name : 'WormHole',
	#superclass : 'Effect',
	#instVars : [
		'positionY',
		'positionZ'
	],
	#classInstVars : [
		'positionY'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
WormHole class >> at: arg1 [

	^ self new initializeWith: arg1
]

{ #category : 'as yet unclassified' }
WormHole class >> at: start and: finish [

	^ self new initializeWith: start and: finish
]

{ #category : 'as yet unclassified' }
WormHole class >> effectProbability [

	^ 0
]

{ #category : 'as yet unclassified' }
WormHole >> applyEffectTo: aShip [
	| effect |
	effect := self applyWormEffectTo: aShip position.
	^effect
]

{ #category : 'as yet unclassified' }
WormHole >> applyWormEffectTo: myActualPosition [ 
    | isInPositionY isInPositionZ |
    isInPositionY := myActualPosition = positionY.
    isInPositionZ := myActualPosition = positionZ.

    isInPositionY ifTrue: [ ^ (positionZ - positionY) ].
    isInPositionZ ifTrue: [ ^ (positionZ - positionY) negated ].
    ^ 0

]

{ #category : 'initialization' }
WormHole >> initializeWith: arg1 [

	positionY := arg1
]

{ #category : 'as yet unclassified' }
WormHole >> initializeWith: aPositionY and: aPositionZ [
	aPositionY negative ifTrue: [ Error signal: 'The WormHole Position can not be negative' ].
	aPositionZ negative ifTrue: [ Error signal: 'The WormHole Position can not be negative' ].
	positionY:=aPositionY.
	positionZ:=aPositionZ.
]

{ #category : 'method' }
WormHole >> validatePosition: aPosition [ 
	^(positionY == aPosition) or: (positionZ == aPosition).
]

{ #category : 'as yet unclassified' }
WormHole >> whereIsMyPositionY [

	^ positionY
]

{ #category : 'as yet unclassified' }
WormHole >> whereIsMyPositionZ [

	^ positionZ
]
