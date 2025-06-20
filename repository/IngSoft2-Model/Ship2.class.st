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
Ship2 class >> createWhithId: anId andWithFuel: anFuel [
	^self new initializewith:anId andfuel:anFuel.
]

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
Ship2 >> fellinatomicbomb [

	position:=0.
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

{ #category : 'as yet unclassified' }
Ship2 >> laps [
	"este metodo solo debe ser usado por los tests"
	^laps.
]

{ #category : 'as yet unclassified' }
Ship2 >> moveBy: steps moveManager: aMoveManager [ 
	fuel < (steps abs) 
    ifTrue: [aMoveManager blockship: self]
    ifFalse: [position := position + steps. self consumeFuel: steps. lapmanger laphandler:self with: aMoveManager].
]

{ #category : 'as yet unclassified' }
Ship2 >> position [
    "Devuelve la posición actual"
    ^ position
]

{ #category : 'initialization' }
Ship2 >> refillFuel: anAmount [
    fuel := fuel + anAmount.
]

{ #category : 'as yet unclassified' }
Ship2 >> shiptimeout:anumber  movemanger:amanager [
timeout==2 ifTrue: [ amanager unblock:self. timeout:=1. self refillFuel:maxfuel] ifFalse: [timeout:=timeout+1].
]
