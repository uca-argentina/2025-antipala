"
clase ShipBuilder: Se encarga de crear diferentes naves. Se puede cambiar el combustible de las naves a contruir con maxFuelWith: 

"
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

{ #category : 'method' }
Shipbuilder >> build [
	|newship|
	newship := Ship createWhithId:actualId andWithFuel:maxFuel andwithlapmanager:lapmanager.
	actualId:= actualId+1.
	^newship.

	
]

{ #category : 'initialize' }
Shipbuilder >> initializewith: alapmanager and: aSetOfDices [
	actualId:=1.
	lapmanager := alapmanager.
	self maxFuelWith: aSetOfDices
]

{ #category : 'method' }
Shipbuilder >> maxFuelWith: aSetOfDices [
	| maxDices sumOfMaxDices |
	maxDices:=(aSetOfDices collect: [:d | d max]) .
	sumOfMaxDices:=maxDices inject: 0 into: [:sum :each | sum + each].
	maxFuel := sumOfMaxDices * 2.
]
