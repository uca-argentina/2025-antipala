Class {
	#name : 'Game',
	#superclass : 'Object',
	#instVars : [
		'dices',
		'gameBoard',
		'ships',
		'shipPlaying'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'initialization' }
Game class >> setDices: aCollectionOfDices setGameBoard: aGameBoard setShips: aCollectionOfShips [ 
	^(self new) intializeWith: aCollectionOfDices and: aGameBoard and: aCollectionOfShips .
]

{ #category : 'initialize' }
Game >> intializeWith: aCollectionOfDices and: aGameBoard and: aCollectionOfShips [ 
	shipPlaying :=1.
	dices:= aCollectionOfDices.
	gameBoard := aGameBoard.
	ships := aCollectionOfShips.
]

{ #category : 'method' }
Game >> terminoJuego [
	
	| ship |
	ship:= (ships at: shipPlaying).
	ship position >= gameBoard getSquares ifTrue: [^'gano la nave ', ship getId ] ifFalse: [^'no']
]

{ #category : 'as yet unclassified' }
Game >> throwDices [
	| throw |

	"throw := dices inject: 0 into: [:sum :eachDice | sum + (eachDice roll) ]."
	throw := 5.
	gameBoard move: (ships at: shipPlaying) with: throw.
	^throw.

]
