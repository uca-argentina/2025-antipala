Class {
	#name : 'Effectsmanager',
	#superclass : 'Object',
	#instVars : [
		'effectlist'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Effectsmanager class >> creatwitheffect: aCollectionofeffects [ 
	^self new initwitheffects:aCollectionofeffects.
]

{ #category : 'as yet unclassified' }
Effectsmanager >> applyAnEffectTo: aShip2 [ 
	| effect |
    effect := effectlist detect: [:each | each shouldApplyTo: aShip2 ] ifNone: [ NoEffect new].
    effect applyEffectTo: aShip2.

]

{ #category : 'as yet unclassified' }
Effectsmanager >> initwitheffects: aCollectionofeffects [
	effectlist:=aCollectionofeffects
]
