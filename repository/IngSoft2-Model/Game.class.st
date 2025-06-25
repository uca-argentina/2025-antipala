"
Clase game: Se encarga de mantener el flujo del juego, tirando dados y jugando.
"
Class {
	#name : 'Game',
	#superclass : 'Object',
	#instVars : [
		'ships',
		'setofdices',
		'boardlength',
		'movemanager',
		'currentPlayerIndex',
		'lapsToWin',
		'shipbuilder',
		'effectsManager'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'creation' }
Game class >> createWith:anBoardlength and: dices and: aCollectionofeffects and: numberOfLapsToWin [
	^ self new initializeWith: anBoardlength and: dices and: aCollectionofeffects and: numberOfLapsToWin
]

{ #category : 'playing' }
Game >> addShip [
	currentPlayerIndex > 0 ifTrue: [
		Error signal: 'The game started, you cant add ships' ].
	ships add: shipbuilder build
]

{ #category : 'playing' }
Game >> giveRewardTo: player [

	self throwdice / self maxThrow <= 0.8
		ifTrue: [ player changeMaxFuelBy: 1 ]
		ifFalse: [ player changeMaxFuelBy: -1 ]
]

{ #category : 'playing' }
Game >> handleRewardsWith: playerthrow and: player [

	self maxThrow = playerthrow ifTrue: [ self giveRewardTo: player ]
]

{ #category : 'initialize' }
Game >> initializeWith: anBoardlength and: dices and: aCollectionofeffects and: numberOfLapsToWin [

	dices isEmpty ifTrue: [ Error signal: 'you cant play without dices' ].
	boardlength := anBoardlength.
	setofdices := dices.
	lapsToWin := numberOfLapsToWin.
	currentPlayerIndex := 0.

	movemanager := MoveManager createWith:
		               (LapManager createWith: anBoardlength) and: (CardManager createWith: #())
.
	effectsManager := EffectsManager
		                 createWith: aCollectionofeffects
		                 and: movemanager.


	shipbuilder := ShipBuilder buildWith: dices.
	ships := OrderedCollection new
]

{ #category : 'playing' }
Game >> maxThrow [

	^ setofdices
		            inject: 0
		            into: [ :sum :eachDice | sum + eachDice max ].
]

{ #category : 'playing' }
Game >> moveAllShipsExcept: shipToExclude by: walk [

    ships do: [ :aShip |
        aShip == shipToExclude ifFalse: [
            movemanager move: aShip by: walk
        ].
    ].
]

{ #category : 'playing' }
Game >> moveAllShipsToTheInitialPosition [
	ships do: [:ship | movemanager resetPosition: ship].
]

{ #category : 'playing' }
Game >> play [

	| player playerthrow |
	ships isEmpty ifTrue: [ Error signal: 'you cant play without ships' ].
	self winner ifNotNil: [ Error signal: 'the game ended' ].
	currentPlayerIndex := currentPlayerIndex \\ ships size + 1.
	player := ships at: currentPlayerIndex.

	playerthrow := self throwdice.
	self handleRewardsWith: playerthrow and: player.

	movemanager move: player by: playerthrow.
	effectsManager applyAnEffectTo: player in: self with: playerthrow
]

{ #category : 'playing' }
Game >> ranking [

	^ (ships copy) sort: [:shipA :shipB | shipA isAheadOf: shipB].
]

{ #category : 'playing' }
Game >> repostFuel [

	| player |
	ships isEmpty ifTrue: [ Error signal: 'you cant play without ships' ].
	self winner ifNotNil: [ Error signal: 'the game ended' ].
	currentPlayerIndex := currentPlayerIndex \\ ships size + 1.
	player := ships at: currentPlayerIndex.
	player refillFuel
]

{ #category : 'private - testing' }
Game >> ship:index [
"Este metodo solamente se debe usar para Testeo"
	^ships at:index
]

{ #category : 'playing' }
Game >> throwdice [
 | totalThrow |
totalThrow:= setofdices
		         inject: 0
		         into: [ :sum :eachDice | sum + eachDice roll ]. 
		^totalThrow.
]

{ #category : 'playing' }
Game >> winner [

	^ships detect: [:ship | ship isAtLap:lapsToWin ] ifNone: [nil]
]
