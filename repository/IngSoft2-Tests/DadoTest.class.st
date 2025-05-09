Class {
	#name : 'DadoTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
DadoTest >> testCrearDadoEntre1y6variasveces [
	| aDice aNumber |
	aDice := Dice new.

	100 timesRepeat: [
		aNumber := aDice roll.
		self assert: (aNumber >= 1 and: [aNumber <= 6]).
	].
]

{ #category : 'tests' }
DadoTest >> testCrearDadodeXcaras [
	| aDice |
	aDice:=Dice new .
	self assert: ((aDice roll) >= 1 and:(aDice roll <= 6)).
]

{ #category : 'tests' }
DadoTest >> testCrearDadoentre1y6 [

	| aDice |
	aDice:=Dice new .
	self assert: ((aDice roll) >= 1 and:(aDice roll <= 6)).
]
