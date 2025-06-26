Class {
	#name : 'Acceleration',
	#superclass : 'Cards',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'creation' }
Acceleration class >> create [
	^ self new
]

{ #category : 'method' }
Acceleration >> applyEffect: aShip with: cardManager [

	cardManager applyAcceleration: self.
]

{ #category : 'method' }
Acceleration >> effectAppliedTo: aShip [
	^1
]
