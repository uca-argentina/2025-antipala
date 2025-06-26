Class {
	#name : 'Cancelation',
	#superclass : 'Cards',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Cancelation >> applyEffect: aShip with: aCardManager [ 
	aCardManager removePermanentCard.
]

{ #category : 'as yet unclassified' }
Cancelation >> intialize [
	
]
