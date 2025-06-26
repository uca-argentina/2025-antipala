Class {
	#name : 'CardGiver',
	#superclass : 'Effect',
	#instVars : [
		'lastCard',
		'diceOf6Faces'
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
	cardClasses := { Ally. Acceleration . OverLoad.}.

	selectedCard := cardClasses at: (diceOf6Faces roll).

	lastCard := selectedCard create.
	^ lastCard .
]

{ #category : 'initialization' }
CardGiver >> initializeWith: aDice [
	diceOf6Faces:= aDice.
	lastCard := nil.
]

{ #category : 'method' }
CardGiver >> lastCardGived [
	^ lastCard
]
