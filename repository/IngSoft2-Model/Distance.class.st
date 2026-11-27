Class {
	#name : 'Distance',
	#superclass : 'Object',
	#instVars : [
		'amount'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'instance creation' }
Distance class >> of: anAmount [
 anAmount > 0 ifFalse: [ self error: 'The distance must be positive' ].
 ^ self new initializeWith: anAmount
]

{ #category : 'initialization' }
Distance >> inLightYears [

	^ self inParsecs * 3
]

{ #category : 'initialization' }
Distance >> inParsecs [

	^ self subclassResponsibility
]

{ #category : 'initialization' }
Distance >> initializeWith: anAmount [
	amount:= anAmount
]
