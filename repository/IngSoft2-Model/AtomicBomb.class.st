"
Clase AtomicBomb. Efecto que hace volver a cada nave a 1er posicion del tablero, sin gastar combustible, cuando una nave aterriza sobre el efecto.
"
Class {
	#name : 'AtomicBomb',
	#superclass : 'Effect',
	#instVars : [
		'active',
		'atomicBombPosition',
		'shipsAffected'
	],
	#classInstVars : [
		'positionY'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'initialize' }
AtomicBomb class >> at: positions [ 

	^ self new initializeWith: positions
]

{ #category : 'as yet unclassified' }
AtomicBomb class >> effectProbability [

	^ 0.02
]

{ #category : 'as yet unclassified' }
AtomicBomb >> applyEffectTo: ship [
	
	shipsAffected add: ship.
	ship moveToFirstPosition
	
]

{ #category : 'as yet unclassified' }
AtomicBomb >> initializeWith: position [
	atomicBombPosition := position.
	shipsAffected:=OrderedCollection new.
	active:=false
]

{ #category : 'as yet unclassified' }
AtomicBomb >> shouldApplyTo: aShip [

	^ aShip isAt: atomicBombPosition
]

{ #category : 'as yet unclassified' }
AtomicBomb >> triggerBeforeMove: ship [
(shipsAffected includes: ship ) ifTrue: [ 
	shipsAffected removeAll ].  
shipsAffected isNotEmpty ifTrue: [ 
	ship moveToFirstPosition ].
 




]
