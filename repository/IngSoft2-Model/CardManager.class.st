Class {
	#name : 'CardManager',
	#superclass : 'Object',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
CardManager >> apply: Acard from: aShip to: aTargetShip [
	
	Acard applyeffect:aShip to:aTargetShip.
	
]
