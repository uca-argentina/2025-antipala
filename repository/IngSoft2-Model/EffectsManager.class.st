"
clase EffectManager: Se encarga de conocer los efectos y de aplicarlos si corresponde.
"
Class {
	#name : 'EffectsManager',
	#superclass : 'Object',
	#instVars : [
		'moveManager',
		'game',
		'actualThrow',
		'lastEffect',
		'tileList'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'creation' }
EffectsManager class >> createWith: aCollectionOfTilesWithEffects and: aMoveManager [
	^self new initwitheffects: aCollectionOfTilesWithEffects and: aMoveManager.
]

{ #category : 'method' }
EffectsManager >> applyAnEffectTo: aShip in: aGame with: playerthrow [

	| effect |
	actualThrow := playerthrow.
	game := aGame.
	effect := (tileList at: (aShip position)) applyEffectTo: aShip with: self 
]

{ #category : 'method effects' }
EffectsManager >> block: aShip [

	moveManager block: aShip by: 1
]

{ #category : 'method effects' }
EffectsManager >> forceApplyLastEffectTo: aShip [

	lastEffect applyEffectTo: aShip with: self.
]

{ #category : 'method effects' }
EffectsManager >> handleHyperGravityCondition: hyperGravityXValue in: aShip with: hyperGravity [

	actualThrow < hyperGravityXValue
		ifTrue: [ self block: aShip ]
		ifFalse: [
			self move: aShip by: actualThrow.
			hyperGravity changeState: (StateInactiveHyperGravity createWith: hyperGravity and: hyperGravityXValue )]
]

{ #category : 'initialize' }
EffectsManager >> initwitheffects: aCollectionOfTilesWithEffects and: aMoveManager [

	tileList := aCollectionOfTilesWithEffects.
	moveManager := aMoveManager.
	lastEffect := NoEffect create.
]

{ #category : 'method effects' }
EffectsManager >> move: aShip by: jumpSquares [

	moveManager move: aShip by: jumpSquares
]

{ #category : 'method effects' }
EffectsManager >> moveAllShipsExcept: ship by: walk [

	game moveAllShipsExcept: ship by: walk
]

{ #category : 'method' }
EffectsManager >> putLastEffect: effect [

	lastEffect := effect .
]

{ #category : 'method effects' }
EffectsManager >> triggerAtomicBomb [
	game moveAllShipsToTheInitialPosition.
]
