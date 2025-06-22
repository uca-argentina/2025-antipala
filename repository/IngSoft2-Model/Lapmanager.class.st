"
Clase LapManager: Se encarga de manejar el correcto funcionamiento de vueltas al tablero de todas las naves
"
Class {
	#name : 'Lapmanager',
	#superclass : 'Object',
	#instVars : [
		'boardSize'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Lapmanager class >> createWith: aBoardSize [ 
	^self new initializeWith: aBoardSize.
]

{ #category : 'as yet unclassified' }
Lapmanager >> handle: aship with: aMoveManager [

	| lapsDoneByTheShip |
	lapsDoneByTheShip := aship lapsToApplyWith: boardSize.
	aship changeLapsBy: lapsDoneByTheShip.
	aship
		moveBy: boardSize * lapsDoneByTheShip negated
]

{ #category : 'as yet unclassified' }
Lapmanager >> initializeWith: aboardSize [
	boardSize:=aboardSize.
]
