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

{ #category : 'as yet unclassified' }
ShipBuilder class >> createWith: aSetOfDices [
	^self new initializeWith: aSetOfDices.
]

{ #category : 'building' }
ShipBuilder >> build [
	|ship|
	ship := Ship create: actualId with:maxFuel.
	actualId:= actualId+1.
	^ship.
]

{ #category : 'initialization' }
ShipBuilder >> initializeWith: aSetOfDices [
	| maxDices sumOfMaxDices |
	actualId:=1.
	maxDices:=(aSetOfDices collect: [:d | d max]) .
	sumOfMaxDices:=maxDices inject: 0 into: [:sum :each | sum + each].
	maxFuel := sumOfMaxDices * 2.
]
