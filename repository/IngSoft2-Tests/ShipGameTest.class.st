Class {
	#name : 'ShipGameTest',
	#superclass : 'TestCase',
	#instVars : [
		'game'
	],
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'test' }
ShipGameTest >> testcreateAShipGame [
game := ShipGame createShipPlayer:3 lengthOfBoard:30 diceAmount:2 withfaces:5.

game play.
self assert: (game playerpostion:1) equals:10.
self assert: (game playerpostion:3) equals:0.

]

{ #category : 'test' }
ShipGameTest >> testcreateAShipGamepasaturno [
game := ShipGame createShipPlayer:3 lengthOfBoard:30 diceAmount:2 withfaces:5.

game play.
self assert: (game playerpostion:1) equals:10.
game play.
self assert: (game playerpostion:2) equals:10.

]
