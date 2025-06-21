Class {
	#name : 'ShipGame',
	#superclass : 'Object',
	#instVars : [
		'ships',
		'setofdices',
		'boardlength',
		'movemanager',
		'manageeffects',
		'currentPlayerIndex'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
ShipGame class >> createShipPlayer: anAmountofShips lengthOfBoard: anBoardlength dices: dices and: aCollectionofeffects [

	^self new initializeWith: anAmountofShips lengthOfBoard: anBoardlength dices: dices and: aCollectionofeffects 
   
]

{ #category : 'initialization' }
ShipGame >> initializeWith: anAmountofShips lengthOfBoard: anBoardlength dices: dices and: aCollectionofeffects [ 
	    
	| alapmanager shipbuilder |
	setofdices := dices.
	boardlength := anBoardlength.
	currentPlayerIndex := 0.

	movemanager := MoveManager create.
	manageeffects := Effectsmanager
		                 createWith: aCollectionofeffects
		                 and: movemanager.
	alapmanager := Lapmanager createWith: anBoardlength.

	shipbuilder := Shipbuilder buildWith: alapmanager and: dices.
	ships := OrderedCollection new.
	anAmountofShips timesRepeat: [ ships add: shipbuilder build ]

]

{ #category : 'playing' }
ShipGame >> moveAllShipsToTheInitialPosition [
	ships do: [:ship | movemanager resetPosition: ship].
]

{ #category : 'playing' }
ShipGame >> play [
|player playerthrow|


currentPlayerIndex := currentPlayerIndex \\ ships size + 1. 
player:=ships at: currentPlayerIndex.
playerthrow:=self throwdice.

movemanager move: player  by: playerthrow.
manageeffects applyAnEffectTo: player in: self.

]

{ #category : 'as yet unclassified' }
ShipGame >> playerpostion: anID [ 
	^(ships at:anID) position.
]

{ #category : 'tests - accessing' }
ShipGame >> ship:index [
"Este metodo solamente se debe usar para Testeo"
	^ships at:index
]

{ #category : 'as yet unclassified' }
ShipGame >> throwdice [
 | totalThrow |
totalThrow:= setofdices
		         inject: 0
		         into: [ :sum :eachDice | sum + eachDice roll ]. 
		^totalThrow.
]
