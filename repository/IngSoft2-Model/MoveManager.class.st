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

	listofblockship := OrderedCollection new.
]

{ #category : 'public' }
MoveManager >> move: aShip by: steps [

	| isBlockedByList isBlockedByHyperGravity escapeOK |

	isBlockedByList := listofblockship anySatisfy: [:each | each == aShip].
	isBlockedByHyperGravity := aShip hyperGravityStatus.
	escapeOK := steps > aShip hyperGravityEscapeNumber.

	isBlockedByHyperGravity ifTrue: [
		escapeOK 
			ifTrue: [
				aShip escapeFromHyperGravity.
				aShip moveBy: steps moveManager: self.
				^ self
			]
			ifFalse: [
				aShip shiptimeout: 1 movemanger: self.
				^ self
			].
	].

	isBlockedByList 
		ifTrue: [
			aShip shiptimeout: 1 movemanger: self.
		]
		ifFalse: [
			aShip moveBy: steps moveManager: self.
		].


		
]

{ #category : 'as yet unclassified' }
MoveManager >> unblock:aship [

listofblockship removeAllSuchThat: [:each | each == aship ].
]
