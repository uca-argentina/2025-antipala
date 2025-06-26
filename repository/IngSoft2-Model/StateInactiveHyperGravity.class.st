"
clase StateActiveHyperGravity: Maneja el estado inactivo de Hypergravity, siendo este la primera vez que una nave cae en el hypergravity.
"
Class {
	#name : 'StateInactiveHyperGravity',
	#superclass : 'HyperGravity',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
StateInactiveHyperGravity class >> createWith: hyperGravity and: hyperGravityXValue [

	^ self new initializeWith: hyperGravity and: hyperGravityXValue
]

{ #category : 'method' }
StateInactiveHyperGravity >> activateWith: anEffectManager on: aShip [

	anEffectManager block: aShip.
	effect changeState: (StateActiveHyperGravity createWith: effect and: hyperGravityXValue).
	anEffectManager putLastEffect: self.
]

{ #category : 'method' }
StateInactiveHyperGravity >> forceApplyTo: aShip with: anEffectManager [

	anEffectManager block: aShip.
	effect changeState:
		(StateActiveHyperGravity createWith: effect and: hyperGravityXValue)
]

{ #category : 'initialization' }
StateInactiveHyperGravity >> initializeWith: hyperGravity and: anHyperGravityXValue [

	effect := hyperGravity.
	hyperGravityXValue := anHyperGravityXValue.
]
