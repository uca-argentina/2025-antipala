"
Clase WormHole. Efecto en el cual si una nave aterriza en su posicion Y, esta se desplaza a su posicion Z.
"
Class {
	#name : 'WormHole',
	#superclass : 'Effect',
	#instVars : [
		'exitRelativeDistance'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'creation' }
WormHole class >> createWith: aDistanceToTheWormholeExit [
	aDistanceToTheWormholeExit ifNil: [ self error:'The WormHole distance should be a number'].
	^ self new initializeWith: aDistanceToTheWormholeExit 
]

{ #category : 'method' }
WormHole >> applyEffectTo: aShip with: anEffectManager [
	

	anEffectManager move: aShip by: exitRelativeDistance .

]

{ #category : 'method' }
WormHole >> initializeWith: aExitDistance [
	
	exitRelativeDistance:= aExitDistance.
]
