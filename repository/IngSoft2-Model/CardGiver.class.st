"
clase CardGiver: Da cartas a las naves con una probabilidad uniforme
"
Class {
	#name : 'CardGiver',
	#superclass : 'Effect',
	#instVars : [
		'lastCard',
		'diceOf5Faces'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
CardGiver class >> createWith: aDice [
	^ self new initializeWith: aDice
]

{ #category : 'method' }
CardGiver >> applyEffectTo: aShip with: effectManager [
	aShip addCard: self createRandomCard
]

{ #category : 'method' }
CardGiver >> createRandomCard [

	| cardClasses selectedCard |
	cardClasses := { Acceleration. Ally. Cancelation. OverLoad. Redo.}.

	selectedCard := cardClasses at: (diceOf5Faces roll).

	lastCard := selectedCard create.
	^ lastCard .
]

{ #category : 'initialization' }
CardGiver >> initializeWith: aDice [
	diceOf5Faces:= aDice.
	lastCard := nil.
]

{ #category : 'method' }
CardGiver >> lastCardGived [
	^ lastCard
]
