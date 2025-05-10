Class {
	#name : 'Game',
	#superclass : 'Object',
	#instVars : [
		'dices',
		'gameBoard',
		'ships',
		'shipPlaying',
		'theGameHasFinish'
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

{ #category : 'method' }
Game >> terminoJuego [
    | ship |
    
    theGameHasFinish ifTrue: [ ^'El juego terminó' ].

    ship := ships at: shipPlaying.
    (ship position >= gameBoard getSquares)
        ifTrue: [
            theGameHasFinish := true.
            ^'Ganó la nave ', (ship getId) asString
        ]
        ifFalse: [ ^'El juego sigue' ].
]

{ #category : 'as yet unclassified' }
Game >> throwDices [
	| throw text idActual |
	
	theGameHasFinish ifTrue: [ Error signal: 'el juego termino' ].
	throw := dices inject: 0 into: [:sum :eachDice | sum + (eachDice roll) ].
	gameBoard move: (ships at: shipPlaying) with: throw.
	idActual:= ((ships at: shipPlaying) getId ) asString.
	text:= ('the ship ',idActual, ' moves')  ."la nave 1 avanzo"
	shipPlaying := shipPlaying < (ships size) ifTrue: (shipPlaying +1) ifFalse: (1).
	^text .

]
