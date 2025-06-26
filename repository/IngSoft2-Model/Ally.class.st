Class {
	#name : 'Ally',
	#superclass : 'Object',
	#instVars : [
		'linkship'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'operations' }
Ally class >> create [
^self new intialize
]

{ #category : 'as yet unclassified' }
Ally >> applyEffect: aShip with: cardManager [


   self linkShip:aShip.
	cardManager allymetotheothership:self.
	

]

{ #category : 'as yet unclassified' }
Ally >> effectAppliedTo: aShip [
	^0
]

{ #category : 'as yet unclassified' }
Ally >> ifAlly:aShip steps:steps [
|donatorship|
linkship detect:[:ship|aShip==ship] ifNone:[^self]. 
donatorship:= (linkship reject: [:unaNave | unaNave = aShip]) at:1.
donatorship donatefuel:steps ship:aShip.

]

{ #category : 'as yet unclassified' }
Ally >> intialize [
linkship:=OrderedCollection new.
]

{ #category : 'as yet unclassified' }
Ally >> linkShip: aShip [
	(linkship size = 2) ifTrue: [Error signal: 'You can only link 2 ships'].
	linkship add:aShip.
]
