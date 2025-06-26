Class {
	#name : 'Ally',
	#superclass : 'Cards',
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

{ #category : 'method' }
Ally >> applyEffect: aShip with: cardManager [


   self linkShip:aShip.
	cardManager allymetotheothership:self.
	

]

{ #category : 'method' }
Ally >> effectAppliedTo: aShip [
	^0
]

{ #category : 'method' }
Ally >> ifAllyWith:aShip give:fuel [
|donatorship|
linkship detect:[:ship|aShip==ship] ifNone:[^self]. 
donatorship:= (linkship reject: [:unaNave | unaNave = aShip]) at:1.
donatorship donatefuel: fuel ship:aShip.

]

{ #category : 'initialize' }
Ally >> intialize [
linkship:=OrderedCollection new.
]

{ #category : 'method' }
Ally >> linkShip: aShip [
	(linkship size = 2) ifTrue: [Error signal: 'You can only link 2 ships'].
	linkship add:aShip.
]
