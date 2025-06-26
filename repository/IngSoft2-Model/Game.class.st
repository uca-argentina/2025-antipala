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
		'lapsToWin',
		'shipbuilder',
		'effectsManager',
		'currentPlayer',
		'cardManager'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'creation' }
Game class >> createOn: aCollectionOfTilesWithEffects toPlayWith: dices withARequired: numberOfLapsToWin andWithThePlayers: numberOfPlayers [

(numberOfLapsToWin <1) ifTrue: [ self error:'The number of laps must be equal or greater than 1'].
aCollectionOfTilesWithEffects isEmpty ifTrue: [ self error: 'you cant play without tiles' ].
numberOfPlayers <=0 ifTrue: [self error: 'The Game must be created with at least 1 player.' ].
dices isEmpty ifTrue: [ Error signal: 'The game cannot be played without dices.' ].

	^ self new initializeOn: aCollectionOfTilesWithEffects toPlayWith: dices withARequired: numberOfLapsToWin andWithThePlayers: numberOfPlayers
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
Game >> initializeOn: aCollectionOfTilesWithEffects toPlayWith: dices withARequired: numberOfLapsToWin andWithThePlayers: numberOfPlayers [
	boardlength := aCollectionOfTilesWithEffects size.
	setofdices := dices.
	lapsToWin := numberOfLapsToWin.
	currentPlayer := 0.
	cardManager := CardManager create.
	movemanager := MoveManager createWith: boardlength and: cardManager .
		
	effectsManager := EffectsManager
		                 createWith: aCollectionOfTilesWithEffects
		                 and: movemanager.


	shipbuilder := ShipBuilder buildWith: dices.
	ships := OrderedCollection new.
	numberOfPlayers timesRepeat: [ships add: shipbuilder build ]
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
	self winner ifNotNil: [ Error signal: 'the game ended' ].
	currentPlayer := currentPlayer \\ ships size + 1.
	player := ships at: currentPlayer.

	playerthrow := self throwdice.
	self handleRewardsWith: playerthrow and: player.

	movemanager move: player by: playerthrow.
	effectsManager applyAnEffectTo: player in: self with: playerthrow
]

{ #category : 'playing' }
Game >> play: aCard from: aShip to: aTarget [
	cardManager apply: aCard from: aShip to: aTarget.
]

{ #category : 'playing' }
Game >> playAPermanent: card from: aShip to: aTarget [
	| player |
	self winner ifNotNil: [ Error signal: 'the game ended' ].
	
	player := ships at: ( currentPlayer \\ ships size + 1).
	player = aShip ifFalse:[Error signal: 'Permanent cards can only be played in your turn ' ].
	cardManager apply: card from: player to: aTarget.
]

{ #category : 'playing' }
Game >> ranking [

	^ (ships copy) sort: [:shipA :shipB | shipA isAheadOf: shipB].
]

{ #category : 'playing' }
Game >> repostFuel [

	| player |
	self winner ifNotNil: [ Error signal: 'the game ended' ].
	currentPlayer := currentPlayer \\ ships size + 1.
	player := ships at: currentPlayer.
	player refillFuel
]

{ #category : 'private - testing' }
Game >> ship:index [

	^ships at:index
]

{ #category : 'playing' }
Game >> throwdice [
^ (setofdices collect: [:each | each roll]) sum.
]

{ #category : 'playing' }
Game >> winner [

	^ships detect: [:ship | ship isAtLap:lapsToWin ] ifNone: [nil]
]
