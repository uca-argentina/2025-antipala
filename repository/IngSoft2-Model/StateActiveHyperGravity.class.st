"
clase StateActiveHyperGravity: Maneja el estado activo de Hypergravity
"
Class {
	#name : 'StateActiveHyperGravity',
	#superclass : 'HyperGravity',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'creation' }
StateActiveHyperGravity class >> createWith: hyperGravity and: hyperGravityXValue [

	^ self new initializeWith: hyperGravity and: hyperGravityXValue
]

{ #category : 'method' }
StateActiveHyperGravity >> activateWith: anEffectManager on: aShip [

	anEffectManager
		handleHyperGravityCondition: hyperGravityXValue
		in: aShip
		with: effect.
	anEffectManager putLastEffect: self.
]

{ #category : 'initialization' }
StateActiveHyperGravity >> initializeWith: hyperGravity and: anHyperGravityXValue [

	effect := hyperGravity.
	hyperGravityXValue := anHyperGravityXValue.
]
