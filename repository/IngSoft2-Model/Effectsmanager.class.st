Class {
	#name : 'Effectsmanager',
	#superclass : 'Object',
	#instVars : [
		'effectlist',
		'moveManager',
		'game'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Effectsmanager class >> createWith: aCollectionofeffects and: aMoveManager [
	^self new initwitheffects:aCollectionofeffects and: aMoveManager.
]

{ #category : 'as yet unclassified' }
Effectsmanager >> applyAnEffectTo: aShip2 in: aGameState [
	| effect |
	game:= aGameState.
   effect := effectlist detect: [:each | each shouldApplyTo: aShip2 ] ifNone: [ NoEffect new].
   effect applyEffectTo: aShip2 with: self.
	 
	"Rompe tell dont ask"
]

{ #category : 'as yet unclassified' }
Effectsmanager >> initwitheffects: aCollectionofeffects and: aMoveManager [
	effectlist:=aCollectionofeffects.
	moveManager:= aMoveManager.
]

{ #category : 'as yet unclassified' }
Effectsmanager >> triggerAtomicBomb [
	game moveAllShipsToTheInitialPosition.
]
