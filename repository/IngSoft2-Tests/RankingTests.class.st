Class {
	#name : 'RankingTests',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
RankingTests >> testBanana [

|game |
game := ShipGame createShipPlayer:3 lengthOfBoard:3 diceAmount:2 withfaces:5 withAMaxOfLaps:3.
game play.
game play.
game play.
self assert:(game winner isNotNil).

]
