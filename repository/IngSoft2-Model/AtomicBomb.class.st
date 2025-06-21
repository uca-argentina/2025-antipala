"
Clase AtomicBomb. Efecto que hace volver a cada nave a 1er posicion del tablero, sin gastar combustible, cuando una nave aterriza sobre el efecto.
"
Class {
	#name : 'AtomicBomb',
	#superclass : 'Effect',
	#instVars : [
		'effectposition',
		'applytoallships',
		'active'
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
AtomicBomb >> applyEffectTo: actualShip [
| hasitbeenapply |
hasitbeenapply:=applytoallships anySatisfy: [:each | each == actualShip ].
hasitbeenapply ifTrue: [ applytoallships removeAll.  active:=false] ifFalse:  [active := true. actualShip moveToFirstPosition ]

]

{ #category : 'as yet unclassified' }
AtomicBomb >> initializeWith: position [
	effectposition := position.
	applytoallships:=OrderedCollection new.
	active:=false
]

{ #category : 'as yet unclassified' }
AtomicBomb >> shouldApplyTo: aships [

	^(effectposition == aships position or: active)
]
