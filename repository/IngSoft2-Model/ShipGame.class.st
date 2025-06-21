Class {
	#name : 'ShipGame',
	#superclass : 'Object',
	#instVars : [
		'ships',
		'setofdices',
		'boardlength',
		'movemanager',
		'siguiente',
		'manageeffects',
		'maximunNumberOfLaps',
		'ranking',
		'winner'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
ShipGame class >> createShipPlayer: anAmountofShips lengthOfBoard: anBoardlength diceAmount: anDiceamout withfaces: facesofdice [
   |shipcreate setofdice  listofShipplayer dice alapmanager anAtomicBomb effectlist effectmanager |
   shipcreate:=Shipbuilder buildWith: alapmanager and: dice. 
	dice:=ChargeDice new.
	anAtomicBomb :=AtomicBomb at:10.
	effectlist :=OrderedCollection new.
   effectlist add:anAtomicBomb.
   effectmanager:=Effectsmanager creatwitheffect:effectlist.
   setofdice:=OrderedCollection new:anDiceamout  withAll:dice.
   alapmanager:=Lapmanager createWith:anBoardlength.
	"listofShipplayer:=OrderedCollection new:anAmountofShips  withAll: ( shipcreate createship:dice maxface dice:anDiceamout). esto no sirve porque me pone el mismo objeto exactio"
	listofShipplayer := OrderedCollection new.
    anAmountofShips timesRepeat: [listofShipplayer add: (shipcreate createship: dice maxface dice: anDiceamout lapmanager:alapmanager)]. 
	^self new initializeWith:listofShipplayer and:setofdice and:anBoardlength and:effectmanager.   
]

{ #category : 'as yet unclassified' }
ShipGame class >> createShipPlayer: anAmountofShips lengthOfBoard: anBoardlength diceAmount: anDiceamout withfaces: facesofdice withAMaxOfLaps: maxOfLaps [
   |shipcreate setofdice  listofShipplayer dice alapmanager anAtomicBomb effectlist effectmanager |
   shipcreate:=Shipbuilder buildWith: alapmanager and: dice. 
	dice:=ChargeDice new.
	anAtomicBomb :=AtomicBomb at:10.
	effectlist :=OrderedCollection new.
   effectlist add:anAtomicBomb.
   effectmanager:=Effectsmanager creatwitheffect:effectlist.
   setofdice:=OrderedCollection new:anDiceamout  withAll:dice.
   alapmanager:=Lapmanager createWith:anBoardlength.
	"listofShipplayer:=OrderedCollection new:anAmountofShips  withAll: ( shipcreate createship:dice maxface dice:anDiceamout). esto no sirve porque me pone el mismo objeto exactio"
	listofShipplayer := OrderedCollection new.
    anAmountofShips timesRepeat: [listofShipplayer add: (shipcreate createship: dice maxface dice: anDiceamout lapmanager:alapmanager)]. 
	^self new initializeWith:listofShipplayer and:setofdice and:anBoardlength and:effectmanager.   
]

{ #category : 'as yet unclassified' }
ShipGame >> amountOfShips [

^ships.
]

{ #category : 'initialization' }
ShipGame >> initializeWith: anAmountofShips and: setofdice and: anBoardlength and:effectmanager [
	    
	ships:=anAmountofShips.
	setofdices:=setofdice.
	boardlength:=anBoardlength.
	movemanager:=MoveManager create.
	siguiente:=1.
	manageeffects:=effectmanager.
]

{ #category : 'initialization' }
ShipGame >> initializeWith: anAmountofShips and: setofdice and: anBoardlength and:effectmanager and:aMaximunNumberOfLaps [
	    
	ships:=anAmountofShips.
	setofdices:=setofdice.
	boardlength:=anBoardlength.
	movemanager:=MoveManager create.
	siguiente:=1.
	manageeffects:=effectmanager.
	maximunNumberOfLaps:= aMaximunNumberOfLaps.
	ranking := Ranking with: ships and: maximunNumberOfLaps.
	winner:= nil.
]

{ #category : 'accessing' }
ShipGame >> maximunNumberOfLaps [

^maximunNumberOfLaps.
]

{ #category : 'instance creation' }
ShipGame >> newWinner: aShip [

winner:= aShip.
]

{ #category : 'playing' }
ShipGame >> play [
|player playerthrow|

player:=ships at:siguiente.
playerthrow:=self throwdice.
manageeffects applyAnEffectTo:player. 
movemanager move:player  by:playerthrow.
manageeffects applyAnEffectTo:player.
(ranking checkIfShipFinished:player)ifTrue: [self newWinner:player].
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

{ #category : 'accessing' }
ShipGame >> winner [ 
^winner.
]
