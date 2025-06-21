Class {
	#name : 'Ranking',
	#superclass : 'Object',
	#instVars : [
		'ships',
		'maxLaps'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Ranking class >> with: amountOfShips and: aNumberOfLaps [ 
	 ^(self new) initializedWith: amountOfShips  and: aNumberOfLaps. 
]

{ #category : 'as yet unclassified' }
Ranking >> checkIfShipFinished: aShip [

^  (aShip laps)>=maxLaps.
]

{ #category : 'as yet unclassified' }
Ranking >> initializedWith: amountOfShips and: aNumberOfLaps [ 
	ships := amountOfShips.
	maxLaps:= aNumberOfLaps.
]
