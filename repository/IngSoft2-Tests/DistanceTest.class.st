Class {
	#name : 'DistanceTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'running' }
DistanceTest >> should: anErrorBlock raise: anErrorClass withMessageText: errorMessage [
	self
		should: anErrorBlock
		raise: anErrorClass
		withExceptionDo: [ :error |
			self assert: (error messageText) equals: errorMessage ].
]

{ #category : 'running' }
DistanceTest >> testADistanceMustBePositive [
self
		should: [Parsecs of: 0 ]
		raise: Error
		withMessageText: 'The distance must be positive'.
self
		should: [Parsecs of: -1 ]
		raise: Error
		withMessageText: 'The distance must be positive'.		
self
		should: [LightYears of: -3 ]
		raise: Error
		withMessageText: 'The distance must be positive'.

]

{ #category : 'running' }
DistanceTest >> testAParsecIsThreeLightYears [

	self assert: (Parsecs of: 2) inLightYears equals: 6
]

{ #category : 'running' }
DistanceTest >> testThreeLightYearsAreOneParsec [

	self assert: (LightYears of: 9) inParsecs equals: 3
]
