Class {
	#name : 'DadoTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
DadoTest >> testCrearDadoEntre1y6variasveces [
	| aDice aNumber |
	aDice := Dice withFace: 6.

	100 timesRepeat: [
		aNumber := aDice roll.
		self assert: (aNumber >= 1 and: [aNumber <= 6]).
	].
]

{ #category : 'tests' }
DadoTest >> testCrearDadodeXcaras [
	| aDice aNumber |
	aDice := Dice withFace: 10.
		100 timesRepeat: [
		aNumber := aDice roll.
		self assert: (aNumber >= 1 and: [aNumber <= 10]).
	].
]

{ #category : 'tests' }
DadoTest >> testCrearDadoentre1y6 [

	| aDice valor|
   aDice := Dice withFace: 6.
	valor := aDice roll.
	self assert: (valor >= 1 and: [valor <= 6]).
]
