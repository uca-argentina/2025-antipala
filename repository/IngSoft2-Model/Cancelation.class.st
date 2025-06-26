Class {
	#name : 'Cancelation',
	#superclass : 'Cards',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'method' }
Cancelation >> applyEffect: aShip with: aCardManager [ 
	aCardManager removePermanentCard.
]

{ #category : 'initialize' }
Cancelation >> intialize [
	
]
