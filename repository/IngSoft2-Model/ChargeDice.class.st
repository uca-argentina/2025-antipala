Class {
	#name : 'ChargeDice',
	#superclass : 'Object',
	#instVars : [
		'sequenceOfDices',
		'currentIndex'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'operations' }
ChargeDice class >> create [

	^ self new .
]

{ #category : 'method' }
ChargeDice >> initialize [

	sequenceOfDices := #( 1 2 3 4 5 ).
	currentIndex := 1
]

{ #category : 'method' }
ChargeDice >> roll [
	 ^5.
]

{ #category : 'method' }
ChargeDice >> rollGameBoard [
	
	| throw |
	throw := sequenceOfDices at: currentIndex.
	currentIndex := currentIndex = sequenceOfDices size
		                ifTrue: [ 1 ]
		                ifFalse: [ currentIndex + 1 ].
	^ throw
]
