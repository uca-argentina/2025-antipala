"
clase ShipBuilder: Se encarga de crear diferentes naves.

"
Class {
	#name : 'Shipbuilder',
	#superclass : 'Object',
	#instVars : [
		'actualId',
		'maxFuel'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'private - initialization' }
Shipbuilder class >> buildWith: dices [
	^self new initializewith: dices.
]

{ #category : 'method' }
Shipbuilder >> build [
	|newship|
	newship := Ship createWhithId:actualId andWithFuel:maxFuel.
	actualId:= actualId+1.
	^newship.

	
]

{ #category : 'initialize' }
Shipbuilder >> initializewith: aSetOfDices [
	actualId:=1.
	self maxFuelWith: aSetOfDices
]

{ #category : 'method' }
Shipbuilder >> maxFuelWith: aSetOfDices [
	| maxDices sumOfMaxDices |
	maxDices:=(aSetOfDices collect: [:d | d max]) .
	sumOfMaxDices:=maxDices inject: 0 into: [:sum :each | sum + each].
	maxFuel := sumOfMaxDices * 2.
]
