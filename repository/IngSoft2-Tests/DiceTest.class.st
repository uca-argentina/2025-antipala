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
DiceTest >> testCreateADiceBetween1And6Faces [

	| aDice result|
   aDice := Dice withFace: 6.
	result := aDice roll.
	self assert: (result >= 1 and: [result <= 6]).
]

{ #category : 'tests' }
DiceTest >> testCreateADiceBetween1And6FacesSeveralTimes [
	| aDice aNumber |
	aDice := Dice withFace: 6.

	99 timesRepeat: [
		aNumber := aDice roll.
		self assert: (aNumber >= 1 and: [aNumber <= 6]).
	].
]

{ #category : 'tests' }
DiceTest >> testCreateDiceOfXFaces [
	| aDice aNumber |
	aDice := Dice withFace: 10.
		100 timesRepeat: [
		aNumber := aDice roll.
		self assert: (aNumber >= 1 and: [aNumber <= 10]).
	].
]

{ #category : 'tests' }
DiceTest >> testThrowsErrorWhenInitializingWith1OrLessFaces [

	self
		should: [ Dice withFace:1 ]
		raise: Error
		withMessageText:'the dice must have at least 2 faces.'
]
