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
Game class >> with: aCollectionOfDices and: aGameBoard and: aCollectionOfShips [ 
	^(self new) intializeWith: aCollectionOfDices and: aGameBoard and: aCollectionOfShips .
]

{ #category : 'method' }
Game >> hasEnded [

	| ship |
	ship := ships at: shipPlaying.
	theGameHasFinish ifTrue: [^ theGameHasFinish ].
	ship position >= gameBoard squares ifTrue: [
		theGameHasFinish := true.
		"^'Winner ship: ', ship getId asString"
		^ true ].

	"  ^'The game keeps going...'."
	^ false
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
Game >> showPosition [
| texto |
texto := ''.
ships do: [:nave |
    texto := texto , 'The ship: ', (nave getId asString), ', ended in the position: ', (nave position asString), ' '.
].
^texto.
]

{ #category : 'method' }
Game >> throwDices [

	| throw text idActual |
	theGameHasFinish ifTrue: [ Error signal: 'The game ended' ].
	throw := dices
		         inject: 0
		         into: [ :sum :eachDice | sum + eachDice roll ].
	gameBoard move: (ships at: shipPlaying) with: throw.
	idActual := (ships at: shipPlaying) getId asString.
	text := 'the ship ' , idActual , ' moves'. "la nave 1 avanzo"
	self hasEnded ifFalse: [
		shipPlaying := (shipPlaying < ships size)
			               ifTrue: [shipPlaying + 1]
			               ifFalse: [1].
			 ].
	"shipPlaying := shipPlaying < (ships size) ifTrue: (shipPlaying +1) ifFalse: (1)."
	^ text
]

{ #category : 'method' }
Game >> winner [

	| ship |
	ship := ships at: shipPlaying.
	ship position >= gameBoard squares ifTrue: [
		theGameHasFinish := true.
		^ship getId asString
		].

	^nil.
]
