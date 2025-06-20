Class {
	#name : 'ShipGame',
	#superclass : 'Object',
	#instVars : [
		'ships',
		'setofdices',
		'boardlength',
		'movemanager',
		'siguiente'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
ShipGame class >> createShipPlayer: anAmountofShips lengthOfBoard: anBoardlength diceAmount: anDiceamout withfaces: facesofdice [
   |shipcreate setofdice  listofShipplayer dice alapmanager |
   shipcreate:=Shipbuilder init.
	dice:=Chargedice new.
   setofdice:=OrderedCollection new:anDiceamout  withAll:dice.
   alapmanager:=Lapmanager creatwithblock:anBoardlength.
	"listofShipplayer:=OrderedCollection new:anAmountofShips  withAll: ( shipcreate createship:dice maxface dice:anDiceamout). esto no sirve porque me pone el mismo objeto exactio"
	listofShipplayer := OrderedCollection new.
    anAmountofShips timesRepeat: [listofShipplayer add: (shipcreate createship: dice maxface dice: anDiceamout lapmanager:alapmanager)]. 
	^self new initializeWith:listofShipplayer and:setofdice and:anBoardlength.   
]

{ #category : 'initialization' }
ShipGame >> initializeWith: anAmountofShips and: setofdice and: anBoardlength [ 
	    
	ships:=anAmountofShips.
	setofdices:=setofdice.
	boardlength:=anBoardlength.
	movemanager:=MoveManager create.
	siguiente:=1.
]

{ #category : 'playing' }
ShipGame >> play [
|player playerthrow|

player:=ships at:siguiente.
playerthrow:=self throwdice.
movemanager move:player  to:playerthrow.
siguiente :=siguiente+1
]

{ #category : 'as yet unclassified' }
ShipGame >> playerpostion: anID [ 
	^(ships at:anID) position.
]

{ #category : 'as yet unclassified' }
ShipGame >> throwdice [
 | totalThrow |
totalThrow:= setofdices
		         inject: 0
		         into: [ :sum :eachDice | sum + eachDice roll ]. 
		^totalThrow.
]
