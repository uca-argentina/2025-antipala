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
		'actualThrow',
		'lastEffect'
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
EffectsManager >> block: aShip [

	moveManager block: aShip by: 1
]

{ #category : 'method effects' }
EffectsManager >> forceApplyLastEffectTo: aShip [

	lastEffect forceApplyTo: aShip with: self.
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
EffectsManager >> initwitheffects: aCollectionofeffects and: aMoveManager [

	effectlist := aCollectionofeffects.
	moveManager := aMoveManager.
	lastEffect := NoEffect at:0.
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
