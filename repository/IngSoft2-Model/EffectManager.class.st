Class {
	#name : 'EffectManager',
	#superclass : 'Object',
	#instVars : [
		'lastEffect',
		'effects'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'accessing' }
EffectManager >> basicMovementFor: ship withThrow: adiceThrow [
	"Avanza y gasta combustible según el valor del dado"
	ship advance: adiceThrow.
	ship spendfuel: adiceThrow.


]

{ #category : 'accessing' }
EffectManager >> calculateNewPositionFor: ship withMaxSquares: squares [
	"Calcula nueva posición con módulo"
	^ (ship position - 1) \\ squares + 1

]

{ #category : 'accessing' }
EffectManager >> detectObstacleAt: position [
	"Busca un obstáculo que valide la posición, o devuelve nil"
	^ effects detect: [ :e | e validatePosition: position ] ifNone: [ nil ]

]

{ #category : 'accessing' }
EffectManager >> effects: aCollection [
 effects := aCollection.
]

{ #category : 'accessing' }
EffectManager >> handleEffectsFor: ship withThrow: adiceThrow maxSquares: squares [
	| newPosition obstacle effect |

	(self mustEndTurnFor: ship withThrow: adiceThrow) ifTrue: [ ^false ].

	self basicMovementFor: ship withThrow: adiceThrow.

	newPosition := self calculateNewPositionFor: ship withMaxSquares: squares.
	obstacle := self detectObstacleAt: newPosition.

	obstacle ifNotNil: [
		(self handleHyperGravityFor: ship withObstacle: obstacle) ifTrue: [ ^false ].

		effect := obstacle applyEffectTo: ship.
		effect ifNotNil: [
			ship advance: effect.
			ship spendfuel: effect abs.
		].
	].

	^true


]

{ #category : 'accessing' }
EffectManager >> handleHyperGravityFor: ship withObstacle: obstacle [
	"Aplica hipergravedad si corresponde. Devuelve true si termina el turno."
	obstacle isHyperGravity ifTrue: [
		lastEffect := obstacle.
		ship changeHyperGravityStatus: 1.
		Transcript show: 'Entró al HyperGravity por primera vez'; cr.
		^true
	].
	^false

]

{ #category : 'accessing' }
EffectManager >> mustEndTurnFor: ship withThrow: adiceThrow [
    "Devuelve true si el turno debe terminar por efecto de hipergravedad"
    
    (ship hyperGravityStatus = 1 and: [ lastEffect isHyperGravity ]) ifFalse: [ ^false ].

    (lastEffect validateCondition: adiceThrow)
        ifTrue: [
            ship changeHyperGravityStatus: 0.
            Transcript show: 'Termina turno'; cr.
        ]
        ifFalse: [
            Transcript show: 'La condición de hipergravedad no se cumplió'; cr.
        ].

    ^true

]

{ #category : 'asserting' }
EffectManager >> shouldEndTurnDueToHyperGravityWith: adiceThrow for: ship [
    (ship hyperGravityStatus = 1 and: [ lastEffect isHyperGravity ]) ifTrue: [
        (lastEffect validateCondition: adiceThrow)
            ifTrue: [ ship changeHyperGravityStatus: 0 ]
            ifFalse: [ Transcript show: 'La condición de hipergravedad no se cumplió'; cr ].
        ^true
    ].
^false
]
