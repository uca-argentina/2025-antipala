Class {
	#name : 'Game',
	#superclass : 'Object',
	#instVars : [
		'dices',
		'gameBoard',
		'ships',
		'shipPlaying',
		'theGameHasFinish',
		'shipsOnCooldown',
		'numberOfLaps',
		'testGame'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'initialization' }
Game class >> test [

	| numberOfSquares aPositionY aPositionZ wormhole gameboard dices numberOfLaps ships testGame  aCollectionOfEffects|
	numberOfSquares := 15.
	numberOfLaps := 2.
	aPositionY := 5.
	aPositionZ := 9.
	wormhole := WormHole at: aPositionY and: aPositionZ.
	aCollectionOfEffects := OrderedCollection new.
	aCollectionOfEffects add: wormhole.
	gameboard := GameBoard
		             with: numberOfSquares
		             including: aCollectionOfEffects.
	
	dices := OrderedCollection new.
	dices add: ChargeDice new.
	
	ships := OrderedCollection new.

	ships add: (Ship create: 1).
	ships add: (Ship create: 2).
	ships add: (Ship create: 3).
	(ships at: 1 ) setfuel: dices size * (dices at:1) max.
	(ships at: 2 ) setfuel: dices size * (dices at:1) max.
	(ships at: 3 ) setfuel: dices size * (dices at:1) max.	
	testGame := self
		            with: dices
		            and: gameboard
		            and: ships
		            and: numberOfLaps.

	testGame enableTestMode.
	^ testGame
]

{ #category : 'initialization' }
Game class >> testEffects [

	| numberOfSquares  gameboard dices numberOfLaps ships testGame  aCollectionOfEffects  |
	numberOfSquares:= 50.
	dices := OrderedCollection new.
	dices add: ChargeDice new.
	numberOfLaps:= 2.
	
	ships := OrderedCollection new.

	ships add: (Ship create: 1).
	ships add: (Ship create: 2).
	ships add: (Ship create: 3).
	(ships at: 1 ) setfuel: dices size * (dices at:1) max.
	(ships at: 2 ) setfuel: dices size * (dices at:1) max.
	(ships at: 3 ) setfuel: dices size * (dices at:1) max.	
	(ships at:2) advance:1.
	aCollectionOfEffects := OrderedCollection new.
	aCollectionOfEffects add: (MoonWalk at: 5 and: ships and: 3 and: numberOfSquares).
	gameboard := GameBoard
		             with: numberOfSquares
		             including: aCollectionOfEffects.
	

	testGame := self
		            with: dices
		            and: gameboard
		            and: ships
		            and: numberOfLaps.

	testGame enableTestMode.
	^ testGame
]

{ #category : 'initialization' }
Game class >> testWithBoardBuilder [

	| numberOfSquares  gameboard dices numberOfLaps ships testGame  boardbuilder |
	numberOfSquares := 1000.
	numberOfLaps := 2.
	dices := OrderedCollection new.
	dices add: (Dice with:6).
	
	ships := OrderedCollection new.
	ships add: (Ship create: 1).
	ships add: (Ship create: 2).
	ships add: (Ship create: 3).
	
	(ships at: 1 ) setfuel: dices size * (dices at:1) max.
	(ships at: 2 ) setfuel: dices size * (dices at:1) max.
	(ships at: 3 ) setfuel: dices size * (dices at:1) max.	
	boardbuilder:= BoardBuilder with: numberOfSquares and: dices and: ships.
	gameboard:= boardbuilder generateEffectsForBoard .
	testGame := self
		            with: dices
		            and: gameboard
		            and: ships
		            and: numberOfLaps.

	testGame enableTestMode.
	^ testGame
]

{ #category : 'initialization' }
Game class >> with: aCollectionOfDices and: aGameBoard and: aCollectionOfShips [ 
	^(self new) intializeWith: aCollectionOfDices and: aGameBoard and: aCollectionOfShips .
]

{ #category : 'initialization' }
Game class >> with: aCollectionOfDices and: aGameBoard and: aCollectionOfShips and: numberOfLapsToWin [

	^ self new
		  intializeWith: aCollectionOfDices
		  and: aGameBoard
		  and: aCollectionOfShips
		  and: numberOfLapsToWin
]

{ #category : 'method' }
Game >> enableTestMode [ 
	testGame :=true.
]

{ #category : 'method' }
Game >> hasEnded [

	| ship |
	ship := ships at: shipPlaying.
	theGameHasFinish ifTrue: [ ^ theGameHasFinish ].
	ship laps >= numberOfLaps ifTrue: [
		theGameHasFinish := true.
		"^'Winner ship: ', ship getId asString"
		^ true ].

	"  ^'The game keeps going...'."
	^ false
]

{ #category : 'initialize' }
Game >> intializeTestWith: aCollectionOfDices and: aGameBoard and: aCollectionOfShips and: numberOfLapsToWin [

	shipPlaying := 1.
	dices := aCollectionOfDices.
	numberOfLaps := numberOfLapsToWin.
	gameBoard := aGameBoard.
	ships := aCollectionOfShips.
	testGame := true.
	theGameHasFinish := false.
	shipsOnCooldown := Dictionary new
]

{ #category : 'initialize' }
Game >> intializeWith: aCollectionOfDices and: aGameBoard and: aCollectionOfShips [

	shipPlaying := 1.
	dices := aCollectionOfDices.
	gameBoard := aGameBoard.
	testGame :=false.
	ships := aCollectionOfShips.
	theGameHasFinish := false.
	shipsOnCooldown := Dictionary new
]

{ #category : 'initialize' }
Game >> intializeWith: aCollectionOfDices and: aGameBoard and: aCollectionOfShips and: numberOfLapsToWin [

	shipPlaying := 1.
	dices := aCollectionOfDices.
	numberOfLaps := numberOfLapsToWin.
	gameBoard := aGameBoard.
	ships := aCollectionOfShips.
	testGame :=false.
	theGameHasFinish := false.
	shipsOnCooldown := Dictionary new
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
Game >> showPositions [
	
	ships do: [ :nave | UIManager default inform: 'The ship: ' , nave getId asString
		         , ', ended in the position: ' , nave position asString
		         , ' ' ].
]

{ #category : 'method' }
Game >> showRanking [

	| sortedShips totalCasillas |
	totalCasillas := gameBoard squares.

	sortedShips := ships asSortedCollection: [ :a :b |
		               a laps * totalCasillas + a position
		               > (b laps * totalCasillas + b position) ].

	sortedShips withIndexDo: [ :ship :index |
		UIManager default inform:
			'Position ' , index asString , ': Ship ' , ship getId asString
			, ' (laps: ' , ship laps asString , ', position: '
			, ship position asString ,'fuel:',ship fuel asString ,')' ]
]

{ #category : 'method' }
Game >> showShipPosition: id [

	^gameBoard positionOf: id.
]

{ #category : 'method' }
Game >> throwDices [

	| throw text idActual ship respuesta opciones seleccion |
	theGameHasFinish ifTrue: [ Error signal: 'The game ended' ].
	ship := ships at: shipPlaying.
	
	(testGame)
		ifTrue: [ respuesta := 'Sí' ]
		ifFalse: [
			opciones := #( 'Sí' 'No' ).
			seleccion := UIManager default
				chooseFrom: opciones
				title: '¿Querés tirar los dados?'.
			respuesta := opciones at: seleccion ifAbsent: [ ^ 'no tiraste dado' ].

		].
	throw := dices
		         inject: 0
		         into: [ :sum :eachDice | sum + eachDice roll ].
	gameBoard move: ship with: throw.

	respuesta = 'Sí' ifFalse: [
		(ships at: shipPlaying) advanceTurn.
		(ships at: shipPlaying) refill.
		^ 'no tiraste dado'
	].
	



	((shipsOnCooldown includesKey: ship) and: [
		 (shipsOnCooldown at: ship) = ship turn ]) ifTrue: [
		ship refill.
		ship setPosition: 0.
		shipsOnCooldown removeKey: ship ].

	" no tiene combustible y no esta en cooldown"
	(ship fuel <= 0 and: [ (shipsOnCooldown includesKey: ship) not ])
		ifTrue: [
			shipsOnCooldown at: ship put: ship turn + 2.
			ship advanceTurn.
			^ ship getId asString , ' no tiene combustible' ].

	"Si sigue en cooldown, pero aún no le toca salir"
	(shipsOnCooldown includesKey: ship) ifTrue: [
		ship advanceTurn.
		^ ship getId asString , ' no tiene combustible' ].

	"mover normalmente"
	
	idActual := ship getId asString.
	ship advanceTurn.
	text := 'the ship ' , idActual , ' moves'.

	self hasEnded ifFalse: [
		shipPlaying := shipPlaying < ships size
			               ifTrue: [ shipPlaying + 1 ]
			               ifFalse: [ 1 ] ].

	^ text
]

{ #category : 'method' }
Game >> winner [

	| ship |
	ship := ships at: shipPlaying.
	ship laps >= numberOfLaps ifTrue: [
		theGameHasFinish := true.
		^ ship getId asString ].

	^ nil
]
