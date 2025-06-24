Class {
	#name : 'DiceTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
DiceTest >> should: anErrorBlock raise: anErrorClass withMessageText: errorMessage [

	self
		should: anErrorBlock
		raise: anErrorClass
		withExceptionDo: [ :error |
			self assert: (error messageText) equals:
				errorMessage ]
]

{ #category : 'tests' }
DiceTest >> testCreateAChargeDiceReturn5 [

	| aDice result |
	aDice := ChargeDice createWith: #(5).
	result := aDice roll.
	self assert: result equals: 5
]

{ #category : 'tests' }
DiceTest >> testCreateADiceBetween1And6Faces [

	| aDice result |
	aDice := Dice with: 6.
	result := aDice roll.
	self assert: (result between: 1 and: 6)
]

{ #category : 'tests' }
DiceTest >> testCreateADiceBetween1And6FacesSeveralTimes [

	| aDice aNumber |
	aDice := Dice with: 6.

	99 timesRepeat: [
		aNumber := aDice roll.
		self assert: (aNumber between: 1 and: 6) ]
]

{ #category : 'tests' }
DiceTest >> testCreateDiceOfXFaces [

	| aDice aNumber |
	aDice := Dice with: 10.
	100 timesRepeat: [
		aNumber := aDice roll.
		self assert: (aNumber between: 1 and: 10) ]
]

{ #category : 'tests' }
DiceTest >> testTheNumberOfFacesOfADiceCannotBeNegative [
	self
		should: [ Dice new initializeDiceWith: -5 ]
		raise: Error
		withMessageText: 'The number of faces of the dice must be positive'
]

{ #category : 'tests' }
DiceTest >> testThrowsErrorWhenInitializingWith1OrLessFaces [

	self
		should: [ Dice with:1 ]
		raise: Error
		withMessageText:'the dice must have at least 2 faces.'
]
