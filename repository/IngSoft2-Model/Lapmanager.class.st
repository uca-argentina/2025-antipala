"
Clase LapManager: Se encarga de manejar el correcto funcionamiento de vueltas al tablero de todas las naves
"
Class {
	#name : 'LapManager',
	#superclass : 'Object',
	#instVars : [
		'boardSize'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'creation' }
LapManager class >> createWith: aBoardSize [ 
	^self new initializeWith: aBoardSize.
]

{ #category : 'method' }
LapManager >> handle: aship [

	| lapsDoneByTheShip |
	lapsDoneByTheShip := aship lapsToApplyWith: boardSize.
	aship changeLapsBy: lapsDoneByTheShip.
	aship
		moveBy: boardSize * lapsDoneByTheShip negated
]

{ #category : 'initialize' }
LapManager >> initializeWith: aboardSize [
	boardSize:=aboardSize.
]
