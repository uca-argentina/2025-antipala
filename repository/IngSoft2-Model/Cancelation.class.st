"
clase cancelacion: Cancela el efecto de una carta permanente a eleccion
"
Class {
	#name : 'Cancelation',
	#superclass : 'Cards',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'creation' }
Cancelation class >> create [
	^ self new.
]

{ #category : 'method' }
Cancelation >> applyEffect: aShip with: aCardManager [ 
	aCardManager removePermanentCard.
]
