"
clase Redo: Vuelve a aplicar la ultima carta jugada.
"
Class {
	#name : 'Redo',
	#superclass : 'Cards',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'creation' }
Redo class >> create [
	^ self new.
]

{ #category : 'method' }
Redo >> applyEffect: aShip with: aCardManager [ 
	aCardManager playlastcard:aShip .
]

{ #category : 'method' }
Redo >> effectAppliedTo: aShip [
	^0
]
