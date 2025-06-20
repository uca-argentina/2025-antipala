Class {
	#name : 'MoveManager',
	#superclass : 'Object',
	#instVars : [
		'fuelManager',
		'id',
		'listofblockship'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'operations' }
MoveManager class >> create [
	^self new intializeWith:1.
]

{ #category : 'as yet unclassified' }
MoveManager >> blockship:aship [

 listofblockship add:aship.
]

{ #category : 'private - initialization' }
MoveManager >> intializeWith:aid [
	id:=0.
	listofblockship:= OrderedCollection new.
]

{ #category : 'public' }
MoveManager >> move: aShip by: steps [
	| isitblock |
	isitblock:=listofblockship anySatisfy: [:each | each == aShip ] .
	isitblock ifTrue: [ aShip shiptimeout:1  movemanger:self] ifFalse:[aShip moveBy:steps  moveManager:self.]
]

{ #category : 'as yet unclassified' }
MoveManager >> unblock:aship [

listofblockship removeAllSuchThat: [:each | each == aship ].
]
