Class {
	#name : 'CardManager',
	#superclass : 'Object',
	#instVars : [
		'activeCards'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
CardManager >> apply: Acard from: aShip to: aTargetShip [
	
	Acard applyeffect:aShip to:aTargetShip.
	
]

{ #category : 'as yet unclassified' }
CardManager >> throwEffectsFor: aShip [
	| efectos |
	efectos:= activeCards collect: [ :card | card effectAppliedTo: aShip ].
	^ efectos sum 
	
]
