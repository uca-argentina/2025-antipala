"
clase EffectManager: Se encarga de conocer los efectos y de aplicarlos si corresponde.
"
Class {
	#name : 'Effectsmanager',
	#superclass : 'Object',
	#instVars : [
		'effectlist',
		'moveManager',
		'game',
		'actualThrow'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Effectsmanager class >> createWith: aCollectionofeffects and: aMoveManager [
	^self new initwitheffects:aCollectionofeffects and: aMoveManager.
]

{ #category : 'method' }
Effectsmanager >> applyAnEffectTo: aShip2 in: aGameState with: playerthrow [

	| effect |
	actualThrow := playerthrow.
	game := aGameState.
	effect := effectlist
		          detect: [ :each | each shouldApplyTo: aShip2 ]
		          ifNone: [ NoEffect new ].
	effect applyEffectTo: aShip2 with: self

	"Rompe tell dont ask"
]

{ #category : 'method effects' }
Effectsmanager >> handleHyperGravityCondition: hyperGravityXValue in: aShip [

	actualThrow < hyperGravityXValue ifTrue: [
		moveManager block: aShip by: 1 ]
]

{ #category : 'initialize' }
Effectsmanager >> initwitheffects: aCollectionofeffects and: aMoveManager [
	effectlist:=aCollectionofeffects.
	moveManager:= aMoveManager.
]

{ #category : 'method effects' }
Effectsmanager >> move: aShip by: jumpSquares [

	moveManager move: aShip by: jumpSquares
]

{ #category : 'method effects' }
Effectsmanager >> moveAllShipsExcept: ship by: walk [

	game moveAllShipsExcept: ship by: walk
]

{ #category : 'method effects' }
Effectsmanager >> triggerAtomicBomb [
	game moveAllShipsToTheInitialPosition.
]
