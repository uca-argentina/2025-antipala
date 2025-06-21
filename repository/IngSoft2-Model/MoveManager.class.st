"
Clase MoveManager: Se encarga de mover correctamente las naves, teniendo en cuenta bloqueos dados por efectos
"
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
	^self new intialize.
]

{ #category : 'as yet unclassified' }
MoveManager >> block:aship [

 listofblockship add:aship.
 aship moveToFirstPosition.
]

{ #category : 'private - initialization' }
MoveManager >> intialize [
"	id:=0."
	listofblockship:= OrderedCollection new.
]

{ #category : 'public' }
MoveManager >> move: aShip by: steps [
	| isitblock |
	isitblock:=listofblockship anySatisfy: [:each | each == aShip ] .
	
	isitblock ifTrue: [ aShip shiptimeout:1  movemanger:self] ifFalse:[aShip moveBy:steps  moveManager:self.].
	
	"Tambien puede ser esta variante:
	listofblockship detect:[ :each | each == aShip ] ifNone: [aShip moveBy:steps  moveManager:self. ^nil].
	aShip shiptimeout:1  movemanger:self"
]

{ #category : 'as yet unclassified' }
MoveManager >> unblock:aship [

listofblockship removeAllSuchThat: [:each | each == aship ].
]
