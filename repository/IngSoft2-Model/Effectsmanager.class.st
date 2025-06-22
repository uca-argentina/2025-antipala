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

{ #category : 'as yet unclassified' }
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

{ #category : 'as yet unclassified' }
Effectsmanager >> handleHyperGravityCondition: hyperGravityXValue in: aShip [

	actualThrow < hyperGravityXValue ifTrue: [
		moveManager block: aShip by: 1 ]
]

{ #category : 'as yet unclassified' }
Effectsmanager >> initwitheffects: aCollectionofeffects and: aMoveManager [
	effectlist:=aCollectionofeffects.
	moveManager:= aMoveManager.
]

{ #category : 'as yet unclassified' }
Effectsmanager >> move: aShip by: jumpSquares [

	moveManager move: aShip by: jumpSquares
]

{ #category : 'as yet unclassified' }
Effectsmanager >> moveAllShipsExcept: ship by: walk [

	game moveAllShipsExcept: ship by: walk
]

{ #category : 'as yet unclassified' }
Effectsmanager >> triggerAtomicBomb [
	game moveAllShipsToTheInitialPosition.
]
