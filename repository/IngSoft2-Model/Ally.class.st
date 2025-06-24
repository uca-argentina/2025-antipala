Class {
	#name : 'Ally',
	#superclass : 'Object',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Ally >> applyeffect:aShip to:aTargetShip [

aShip allywith:aTargetShip.
aTargetShip allywith: aShip.
]
