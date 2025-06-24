"
clase StateActiveHyperGravity: Maneja el estado activo de Hypergravity
"
Class {
	#name : 'StateActiveHyperGravity',
	#superclass : 'HyperGravity',
	#instVars : [
		'effect'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'creation' }
StateActiveHyperGravity class >> createWith: hyperGravity and: hyperGravityXValue [

	^ self new initializeWith: hyperGravity and: hyperGravityXValue
]

{ #category : 'operations' }
StateActiveHyperGravity >> activateWith: anEffectManager on: aShip [

	anEffectManager
		handleHyperGravityCondition: hyperGravityXValue
		in: aShip
		with: effect.
]

{ #category : 'initialization' }
StateActiveHyperGravity >> initializeWith: hyperGravity and: anHyperGravityXValue [

	effect := hyperGravity.
	hyperGravityXValue := anHyperGravityXValue.
]
