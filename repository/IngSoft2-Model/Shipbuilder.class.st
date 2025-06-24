"
clase ShipBuilder: Se encarga de crear diferentes naves.

"
Class {
	#name : 'ShipBuilder',
	#superclass : 'Object',
	#instVars : [
		'actualId',
		'maxFuel'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'creation' }
ShipBuilder class >> buildWith: dices [
	^self new initializewith: dices.
]

{ #category : 'method' }
ShipBuilder >> build [
	|newship|
	newship := Ship createWhithId:actualId andWithFuel:maxFuel.
	actualId:= actualId+1.
	^newship.

	
]

{ #category : 'initialize' }
ShipBuilder >> initializewith: aSetOfDices [
	actualId:=1.
	self maxFuelWith: aSetOfDices
]

{ #category : 'method' }
ShipBuilder >> maxFuelWith: aSetOfDices [
	| maxDices sumOfMaxDices |
	maxDices:=(aSetOfDices collect: [:d | d max]) .
	sumOfMaxDices:=maxDices inject: 0 into: [:sum :each | sum + each].
	maxFuel := sumOfMaxDices * 2.
]
