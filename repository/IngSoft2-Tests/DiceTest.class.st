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
DiceTest >> testCrearDadoEntre1y6variasveces [
	| aDice aNumber |
	aDice := Dice withFace: 6.

	99 timesRepeat: [
		aNumber := aDice roll.
		self assert: (aNumber >= 1 and: [aNumber <= 6]).
	].
]

{ #category : 'tests' }
DiceTest >> testCrearDadodeXcaras [
	| aDice aNumber |
	aDice := Dice withFace: 10.
		100 timesRepeat: [
		aNumber := aDice roll.
		self assert: (aNumber >= 1 and: [aNumber <= 10]).
	].
]

{ #category : 'tests' }
DiceTest >> testCrearDadoentre1y6 [

	| aDice valor|
   aDice := Dice withFace: 6.
	valor := aDice roll.
	self assert: (valor >= 1 and: [valor <= 6]).
]

{ #category : 'tests' }
DiceTest >> testCuandoCaraEsMenorOIgualAUno [

	self
		should: [ Dice withFace:1 ]
		raise: Error
		withMessageText:'Como mínimo, el dado debe tener 2 caras.'
]
