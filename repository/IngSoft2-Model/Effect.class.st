"
Clase Effect. Effect es un casillero especial que modifica el comportamiento original de las naves que aterricen en estos casilleros.
"
Class {
	#name : 'Effect',
	#superclass : 'Object',
	#instVars : [
		'effectPosition'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'method' }
Effect >> applyEffectTo: ship with: effectManager [

	^ self subclassResponsibility 
]

{ #category : 'method' }
Effect >> shouldApplyTo: aShip [

	^ aShip isAt: effectPosition
]
