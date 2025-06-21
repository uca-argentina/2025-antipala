Class {
	#name : 'Ship2',
	#superclass : 'Object',
	#instVars : [
		'position',
		'fuel',
		'id',
		'maxfuel',
		'lapmanger',
		'timeout',
		'laps'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Ship2 class >> createWhithId: anId andWithFuel: anFuel andwithlapmanager: anlapmanager [
	^self new initializewith:anId andfuel:anFuel andlapmanger:anlapmanager.
]

{ #category : 'as yet unclassified' }
Ship2 >> changeLapsBy: someLaps [
	laps:=laps+someLaps max:0.
]

{ #category : 'initialization' }
Ship2 >> consumeFuel:amount [
   
    fuel := fuel - amount.
]

{ #category : 'as yet unclassified' }
Ship2 >> initializewith: anId andfuel: afuel andlapmanger: anlapmanager [
	fuel:=afuel.
	maxfuel:=afuel.
	id:=anId. 
	position:=0.
	lapmanger:=anlapmanager.
	timeout:=1.
	laps:=0.
	
]

{ #category : 'initialization' }
Ship2 >> isAt: aPosition [
	^position =aPosition 
]

{ #category : 'as yet unclassified' }
Ship2 >> laps [
	"este metodo solo debe ser usado por los tests"
	^laps.
]

{ #category : 'as yet unclassified' }
Ship2 >> lapsToApplyWith: boardSize [
    ^ position // boardSize.
]

{ #category : 'as yet unclassified' }
Ship2 >> moveBy: steps moveManager: aMoveManager [ 
	fuel < (steps abs) 
    ifTrue: [aMoveManager block: self]
    ifFalse: [position := position + steps. self consumeFuel: steps. lapmanger handle:self with: aMoveManager].
]

{ #category : 'as yet unclassified' }
Ship2 >> moveToFirstPosition [

	position:=0.
]

{ #category : 'as yet unclassified' }
Ship2 >> position [
    "Devuelve la posición actual"
    ^ position
]

{ #category : 'initialization' }
Ship2 >> refillFuel [
    fuel := maxfuel .
]

{ #category : 'as yet unclassified' }
Ship2 >> shiptimeout:anumber  movemanger:amanager [
timeout==2 ifTrue: [ amanager unblock:self. timeout:=1. self refillFuel] ifFalse: [timeout:=timeout+1].
]
