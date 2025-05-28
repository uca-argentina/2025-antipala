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

{ #category : 'as yet unclassified' }
EffectManager >> effects: aCollection [
 effects := aCollection.
]

{ #category : 'as yet unclassified' }
EffectManager >> handleEffectsFor: ship withThrow: adiceThrow maxSquares: squares [
	| newPosition obstacle effect |

	"Chequea si está bajo efecto de hipergravedad y si debe terminar el turno"
	(ship hyperGravityStatus = 1 and: [ lastEffect isHyperGravity ])
		ifTrue: [ 
			(lastEffect validateCondition: adiceThrow)
				ifTrue: [ ship changeHyperGravityStatus: 0. ^false ]  "Termina turno"
				ifFalse: [ Transcript show: 'La condición de hipergravedad no se cumplió'; cr. ^false ] 
		].

	"Movimiento básico"
	ship advance: adiceThrow.
	ship spendfuel: adiceThrow.

	"Calcula nueva posición"
	newPosition := (ship position - 1) \\ squares + 1.  "Usa módulo para wraparound"

	"Detecta si hay efecto en la nueva posición"
	obstacle := effects detect: [ :e | e validatePosition: newPosition ] ifNone: [ nil ].

	obstacle ifNotNil: [
		obstacle isHyperGravity ifTrue: [
			lastEffect := obstacle.
			ship changeHyperGravityStatus: 1.
			Transcript show: 'Entró al HyperGravity por primera vez'; cr.
			^false
		].

		"Aplica efecto (si existe)"
		effect := obstacle applyEffectTo: ship.
		effect ifNotNil: [
			ship advance: effect.
			ship spendfuel: effect abs.
		].
	].

	^true  "Turno continúa"

]

{ #category : 'asserting' }
EffectManager >> shouldEndTurnDueToHyperGravityWith: adiceThrow for: ship [
    ^ ship hyperGravityStatus = 1 
        and: [ lastEffect isHyperGravity and: [ 
                (lastEffect validateCondition: adiceThrow) 
                    ifTrue: [
                        ship changeHyperGravityStatus: 0.
                        ^true
                    ]
                    ifFalse: [
                        Transcript show: 'La condición de hipergravedad no se cumplió'; cr.
                        ^true
                    ]
            ]
        ].

]
