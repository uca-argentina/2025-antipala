Class {
	#name : 'CancellationCardTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
CancellationCardTest >> testTheCancellationCardCanDeleteASpecificCard [
	| aCardManager aCard aShip alapmanager manager aTargetCard |
	alapmanager := LapManager createWith: 30.
		aShip := Ship
		        createWhithId: 1
		        andWithFuel: 10.
	manager := MoveManager createWith: alapmanager .
	aCardManager:=CardManager initializeManager.
	aTargetCard:= NoEffectCard new.
	aCardManager addActiveCard: aTargetCard.
	aCard :=CancellationCard new.
	aCardManager apply: aCard from: aShip toDelete: aTargetCard.
	self assert:(aCardManager findActiveCard: aTargetCard) = false.
]
