"
clase ShipBuilder: Se encarga de crear diferentes naves.

"
Class {
	#name : 'ShipBuilder',
	#superclass : 'Object',
	#instVars : [
		'actualId',
		'maxFuel'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'creation' }
ShipBuilder class >> buildWith: dices [
	^self new initializewith: dices.
]

{ #category : 'method' }
ShipBuilder >> add2CardsTo: newShip [
	
	| temporalDice dealer |
	temporalDice:= Dice with:5.
	dealer := CardGiver createWith: temporalDice.
	dealer applyEffectTo: newShip with: self.
	dealer applyEffectTo: newShip with: self.
]

{ #category : 'method' }
ShipBuilder >> build [
	|newShip|
	newShip := Ship createWhithId:actualId andWithFuel:maxFuel.
	actualId:= actualId+1.
	self add2CardsTo: newShip.
	^newShip.

	
]

{ #category : 'initialize' }
ShipBuilder >> initializewith: aSetOfDices [
	actualId:=1.
	self maxFuelWith: aSetOfDices
]

{ #category : 'method' }
ShipBuilder >> maxFuelWith: aSetOfDices [
	| maxDices sumOfMaxDices |
	maxDices:=(aSetOfDices collect: [:d | d max]) .
	sumOfMaxDices:=maxDices inject: 0 into: [:sum :each | sum + each].
	maxFuel := sumOfMaxDices * 2.
]
