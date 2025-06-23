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
		'manageeffects',
		'currentPlayerIndex',
		'lapsToWin'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Game class >> createShipPlayer: anAmountofShips lengthOfBoard: anBoardlength dices: dices and: aCollectionofeffects [

	^self new initializeWith: anAmountofShips lengthOfBoard: anBoardlength dices: dices and: aCollectionofeffects 
   
]

{ #category : 'initialize' }
Game >> initializeWith: anAmountofShips lengthOfBoard: anBoardlength dices: dices and: aCollectionofeffects [ 
	    
	| alapmanager shipbuilder |
	setofdices := dices.
	boardlength := anBoardlength.
	currentPlayerIndex := 0.

	movemanager := MoveManager create.
	manageeffects := Effectsmanager
		                 createWith: aCollectionofeffects
		                 and: movemanager.
	alapmanager := Lapmanager createWith: anBoardlength.

	shipbuilder := Shipbuilder buildWith: alapmanager and: dices.
	ships := OrderedCollection new.
	anAmountofShips timesRepeat: [ ships add: shipbuilder build ]

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
	currentPlayerIndex := currentPlayerIndex \\ ships size + 1.
	player := ships at: currentPlayerIndex.
	playerthrow := self throwdice.

	movemanager move: player by: playerthrow.
	manageeffects applyAnEffectTo: player in: self with: playerthrow.
]

{ #category : 'playing' }
Game >> ranking [

	^ (ships copy) sort: [:shipA :shipB | shipA isAheadOf: shipB].
]

{ #category : 'playing' }
Game >> repostFuel [

	| player |
	currentPlayerIndex := currentPlayerIndex \\ ships size + 1.
	player := ships at: currentPlayerIndex.
	player refillFuel.
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
