"
clase EffectManager: Se encarga de conocer los efectos y de aplicarlos si corresponde.
"
Class {
	#name : 'EffectsManager',
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

{ #category : 'creation' }
EffectsManager class >> createWith: aCollectionofeffects and: aMoveManager [
	^self new initwitheffects:aCollectionofeffects and: aMoveManager.
]

{ #category : 'method' }
EffectsManager >> applyAnEffectTo: aShip2 in: aGameState with: playerthrow [

	| effect |
	actualThrow := playerthrow.
	game := aGameState.
	effect := effectlist
		          do: [ :each | each applyEffectTo: aShip2 with: self ]
]

{ #category : 'method effects' }
EffectsManager >> handleHyperGravityCondition: hyperGravityXValue in: aShip [

	actualThrow < hyperGravityXValue ifTrue: [
		moveManager block: aShip by: 1 ] ifFalse: [ self move: aShip by: actualThrow ]
]

{ #category : 'initialize' }
EffectsManager >> initwitheffects: aCollectionofeffects and: aMoveManager [
	effectlist:=aCollectionofeffects.
	moveManager:= aMoveManager.
]

{ #category : 'method effects' }
EffectsManager >> move: aShip by: jumpSquares [

	moveManager move: aShip by: jumpSquares
]

{ #category : 'method effects' }
EffectsManager >> moveAllShipsExcept: ship by: walk [

	game moveAllShipsExcept: ship by: walk
]

{ #category : 'method effects' }
EffectsManager >> triggerAtomicBomb [
	game moveAllShipsToTheInitialPosition.
]
