Class {
	#name : 'Shipbuilder',
	#superclass : 'Object',
	#instVars : [
		'actualId',
		'maxFuel',
		'lapmanager'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'private - initialization' }
Shipbuilder class >> buildWith: alapmanager and: dices [
	^self new initializewith: alapmanager and: dices.
]

{ #category : 'as yet unclassified' }
Shipbuilder >> build [
	|newship|
	newship := Ship2 createWhithId:actualId andWithFuel:maxFuel andwithlapmanager:lapmanager.
	actualId:= actualId+1.
	^newship.

	
]

{ #category : 'as yet unclassified' }
Shipbuilder >> initializewith: alapmanager and: aSetOfDices [
	actualId:=1.
	lapmanager := alapmanager.
	self maxFuelWith: aSetOfDices
]

{ #category : 'as yet unclassified' }
Shipbuilder >> maxFuelWith: aSetOfDices [
	| maxDices sumOfMaxDices |
	maxDices:=(aSetOfDices collect: [:d | d max]) .
	sumOfMaxDices:=maxDices inject: 0 into: [:sum :each | sum + each].
	maxFuel := sumOfMaxDices * 2.
]
