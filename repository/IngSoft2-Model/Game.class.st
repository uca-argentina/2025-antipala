Class {
	#name : 'Game',
	#superclass : 'Object',
	#instVars : [
		'dices',
		'gameBoard',
		'ships',
		'shipPlaying',
		'theGameHasFinish',
		'finalPositions'
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
	theGameHasFinish := false.
]

{ #category : 'as yet unclassified' }
Game >> setearTerminoElJuego [
 
theGameHasFinish := true.
]

{ #category : 'method' }
Game >> showPosition [
| texto |
texto := ''.
ships do: [:nave |
    texto := texto , 'The ship: ', (nave getId asString), ', ended in the position: ', (nave position asString), ' '.
].
^texto.
]

{ #category : 'method' }
Game >> terminoJuego [
    | ship |

    ship := ships at: shipPlaying.
    (ship position >= gameBoard getSquares)
        ifTrue: [
            theGameHasFinish := true.
            ^'Winner ship: ', ship getId asString
        ].

    ^'The game keeps going...'.
]

{ #category : 'as yet unclassified' }
Game >> throwDices [
	| throw text idActual |
	
	theGameHasFinish ifTrue: [ Error signal: 'The game ended' ].
	throw := dices inject: 0 into: [:sum :eachDice | sum + (eachDice roll) ].
	gameBoard move: (ships at: shipPlaying) with: throw.
	idActual:= ((ships at: shipPlaying) getId ) asString.
	text:= ('the ship ',idActual, ' moves')  ."la nave 1 avanzo"
	shipPlaying := shipPlaying < (ships size) ifTrue: (shipPlaying +1) ifFalse: (1).
	^text .

]
