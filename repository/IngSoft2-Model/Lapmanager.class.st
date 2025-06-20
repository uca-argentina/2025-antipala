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
Lapmanager class >> creatwithblock: anblocknumber [ 
	^self new initwithamoutofblocks:anblocknumber.
]

{ #category : 'as yet unclassified' }
Lapmanager >> initwithamoutofblocks: aboardSize [
	boardSize:=aboardSize.
]

{ #category : 'as yet unclassified' }
Lapmanager >> laphandler: aship with: aMoveManager [
	
	| lapsDoneByTheShip |

	lapsDoneByTheShip := aship position // boardSize. "esto maneja tanto vueltas positivas como negativas"
	lapsDoneByTheShip = 0 ifTrue: [^self].
	aship changeLapsBy: lapsDoneByTheShip .
	aship moveBy: (boardSize * lapsDoneByTheShip negated) moveManager: aMoveManager
]
