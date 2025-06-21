Class {
	#name : 'Shipbuilder',
	#superclass : 'Object',
	#instVars : [
		'id'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'private - initialization' }
Shipbuilder class >> BuildWith: alapmanager and: dices [
	^self new initializewith:alapmanager and: dices.
]

{ #category : 'private - initialization' }
Shipbuilder class >> init [
	^self new initializewith:0.
]

{ #category : 'as yet unclassified' }
Shipbuilder >> createship: amaxface dice: amount lapmanager: anlapmanager [
 | fuelamount newship |
   fuelamount:=(amaxface*amount)*2.
    
	newship := Ship2 createWhithId:id andWithFuel:fuelamount andwithlapmanager:anlapmanager.
	id:=id+1.
	^newship.
	
]

{ #category : 'as yet unclassified' }
Shipbuilder >> initializewith: anId [
	id:=1.
]

{ #category : 'as yet unclassified' }
Shipbuilder >> initializewith: alapmanager and: dices [
	id:=1.
]
