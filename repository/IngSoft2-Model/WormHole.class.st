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
WormHole class >> at: arg1 and: arg2 [

	^ self new initializeWith: arg1 and: arg2
]

{ #category : 'initialization' }
WormHole >> initializeWith: arg1 [

	positionY := arg1
]

{ #category : 'initialization' }
WormHole >> initializeWith: aPositionY and: aPositionZ [ 
	positionY:=aPositionY.
	positionZ:=aPositionZ.
]

{ #category : 'as yet unclassified' }
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
