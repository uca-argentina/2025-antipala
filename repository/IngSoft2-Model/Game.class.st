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

	| numberOfSquares aPositionY aPositionZ wormhole gameboard dices numberOfLaps ships testGame |
	numberOfSquares := 15.
	aPositionY := 5.
	aPositionZ := 10.
	wormhole := WormHole at: aPositionY and: aPositionZ.
	numberOfLaps := 2.
	gameboard := GameBoard with: numberOfSquares and: wormhole.
	ships := OrderedCollection new.
	ships add: (Ship create: 1).
	ships add: (Ship create: 2).
	ships add: (Ship create: 3).
	dices := OrderedCollection new.
	dices add: ChargeDice new.
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
			, ship position asString , ')' ]
]

{ #category : 'method' }
Game >> showShipPosition: id [

	^gameBoard positionOf: id.
]

{ #category : 'method' }
Game >> throwDices [

	| throw text idActual ship respuesta opciones seleccion |
	theGameHasFinish ifTrue: [ Error signal: 'The game ended' ].
	
	(testGame)
		ifTrue: [ respuesta := 'Sí' ]
		ifFalse: [
			opciones := #( 'Sí' 'No' ).
			seleccion := UIManager default
				chooseFrom: opciones
				title: '¿Querés tirar los dados?'.
			respuesta := opciones at: seleccion ifAbsent: [ ^ 'no tiraste dado' ].
		].

	respuesta = 'Sí' ifFalse: [
		(ships at: shipPlaying) advanceTurn.
		(ships at: shipPlaying) refill.
		^ 'no tiraste dado'
	].
	

	ship := ships at: shipPlaying.

	((shipsOnCooldown includesKey: ship) and: [
		 (shipsOnCooldown at: ship) = ship turn ]) ifTrue: [
		ship refill.
		ship setPosition: 0.
		shipsOnCooldown removeKey: ship ].

	" no tiene combustible y no esta en cooldown"
	(ship fuel = 0 and: [ (shipsOnCooldown includesKey: ship) not ])
		ifTrue: [
			shipsOnCooldown at: ship put: ship turn + 2.
			ship advanceTurn.
			^ ship getId asString , ' no tiene combustible' ].

	"Si sigue en cooldown, pero aún no le toca salir"
	(shipsOnCooldown includesKey: ship) ifTrue: [
		ship advanceTurn.
		^ ship getId asString , ' no tiene combustible' ].

	"mover normalmente"
	throw := dices
		         inject: 0
		         into: [ :sum :eachDice | sum + eachDice roll ].
	gameBoard move: ship with: throw.
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
