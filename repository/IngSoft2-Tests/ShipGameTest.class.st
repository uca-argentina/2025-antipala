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
ShipGameTest >> testcreateAShipGameconatomicbomb [
game := ShipGame createShipPlayer:3 lengthOfBoard:30 diceAmount:2 withfaces:5.

game play.
self assert: (game playerpostion:1) equals:0.
self assert: (game playerpostion:3) equals:0.

]

{ #category : 'test' }
ShipGameTest >> testcreateAShipGamepasaturnoconatomicbomb [
game := ShipGame createShipPlayer:3 lengthOfBoard:30 diceAmount:2 withfaces:5.
game play.
self assert: (game playerpostion:1) equals:0.
game play.
self assert: (game playerpostion:2) equals:0.

]

{ #category : 'test' }
ShipGameTest >> testcreateAShipGamepasaturnoconatomicbombperonocaen [
game := ShipGame createShipPlayer:3 lengthOfBoard:30 diceAmount:1 withfaces:5.
game play.
self assert: (game playerpostion:1) equals:5.
game play.
self assert: (game playerpostion:2) equals:5.

]
