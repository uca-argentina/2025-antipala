Class {
	#name : 'CardManager',
	#superclass : 'Object',
	#instVars : [
		'activeCards',
		'targetShip'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'creation' }
CardManager class >> createWith: someCards [
^ self new initializeWith: someCards
]

{ #category : 'as yet unclassified' }
CardManager >> addPermanentCard: card [

	activeCards add: card.
]

{ #category : 'as yet unclassified' }
CardManager >> apply: aCard from: aShip to: aTargetShip [

	targetShip := aTargetShip.
	aCard applyEffect: aShip with: self.
]

{ #category : 'as yet unclassified' }
CardManager >> initializeWith: someCards [
	activeCards := someCards.
	
]

{ #category : 'as yet unclassified' }
CardManager >> linkmyshipwithallycard:aCard [
 aCard linkShip:targetShip.
 self addPermanentCard: aCard 
]

{ #category : 'as yet unclassified' }
CardManager >> throwEffectsFor: aShip [
	| efectos |
	efectos:= activeCards collect: [ :card | card effectAppliedTo: aShip ].
	^ efectos sum 
	
]
