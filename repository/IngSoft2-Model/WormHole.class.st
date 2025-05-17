Class {
	#name : 'WormHole',
	#superclass : 'Object',
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

{ #category : 'accessing' }
WormHole class >> at: start and: finish [

	^ self new initializeWith: start and: finish
]

{ #category : 'method' }
WormHole >> applyWormEffectTo: myActualPosition [ 
	| isInPositionY isInPositionZ |
	isInPositionY:= myActualPosition = positionY.
	isInPositionZ:= myActualPosition = positionZ.
	
	isInPositionY ifTrue: [^positionZ - positionY ].
	isInPositionZ ifTrue: [ ^(positionZ - positionY)negated ].
	^0.
]

{ #category : 'initialization' }
WormHole >> initializeWith: arg1 [

	positionY := arg1
]

{ #category : 'initialization' }
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

{ #category : 'method' }
WormHole >> whereIsMyPositionY [

	^ positionY
]

{ #category : 'method' }
WormHole >> whereIsMyPositionZ [

	^ positionZ
]
