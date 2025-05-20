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
Game class >> test [

	| numberOfSquares aPositionY aPositionZ wormhole gameboard dices |
	numberOfSquares := 50.
	aPositionY := 10.
	aPositionZ := 30.
	wormhole := WormHole at: aPositionY and: aPositionZ.

	gameboard := GameBoard with: numberOfSquares and: wormhole and: 3.

	dices := OrderedCollection new.
	dices add: ChargeDice new.

	^ self with: dices and: gameboard
]

{ #category : 'initialization' }
Game class >> with: aCollectionOfDices and: aGameBoard [
	^(self new) intializeWith: aCollectionOfDices and: aGameBoard.
]

{ #category : 'method' }
Game >> hasEnded [
	
	^gameBoard hasEnded.
	
"	ship := ships at: shipPlaying.
	theGameHasFinish ifTrue: [ ^ theGameHasFinish ].
	ship position >= gameBoard squares ifTrue: [
		theGameHasFinish := true.
		""^'Winner ship: ', ship getId asString""
		^ true ].

	""  ^'The game keeps going...'.""
	^ false"
]

{ #category : 'initialize' }
Game >> intializeWith: aCollectionOfDices and: aGameBoard [
	shipPlaying :=1.
	dices:= aCollectionOfDices.
	gameBoard := aGameBoard.
	theGameHasFinish := false.
]

{ #category : 'method' }
Game >> showShipPosition: id [

	^gameBoard positionOf: id.
]

{ #category : 'method' }
Game >> throwDices [

	| throw idActual text |
	theGameHasFinish ifTrue: [ Error signal: 'The game ended' ].
	idActual := gameBoard shipPlaying asString.
	throw := dices
		         inject: 0
		         into: [ :sum :eachDice | sum + eachDice roll ].
	gameBoard moveShip: throw.
	text := 'the ship ' , idActual , ' moves'. "la nave 1 avanzo"
	"
	self hasEnded ifFalse: [
		shipPlaying := (shipPlaying < ships size)
			               ifTrue: [shipPlaying + 1]
			               ifFalse: [1].
			 ]."
	"shipPlaying := shipPlaying < (ships size) ifTrue: (shipPlaying +1) ifFalse: (1)."
	^ text
]

{ #category : 'method' }
Game >> winner [

	^ gameBoard winner asString.
]
