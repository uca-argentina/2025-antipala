Class {
	#name : 'ShipBuilderTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'tests' }
ShipBuilderTest >> testCrearunanaveymoverla [
	
| ashipBuilder aship manager alapmanager|
ashipBuilder:=Shipbuilder init.
alapmanager:=Lapmanager createWith:15.
aship:=ashipBuilder createship:5 dice:2 lapmanager:alapmanager.
manager := MoveManager create .
manager move: aship by: 10.
self assert: aship position equals: 10. 


]
