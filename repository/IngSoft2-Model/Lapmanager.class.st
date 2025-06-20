Class {
	#name : 'Lapmanager',
	#superclass : 'Object',
	#instVars : [
		'blocscount'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
Lapmanager class >> creatwithblock: anblocknumber [ 
	^self new initwithamoutofblocks:anblocknumber.
]

{ #category : 'as yet unclassified' }
Lapmanager >> initwithamoutofblocks: aBlocnumber [. 
	blocscount:=aBlocnumber.
]

{ #category : 'as yet unclassified' }
Lapmanager >> laphandler:aship [

	aship position >= blocscount ifTrue: [aship increaselap].
]
