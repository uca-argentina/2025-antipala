"
clase card: Clases que van a modificar el comportamiento del juego
"
Class {
	#name : 'Cards',
	#superclass : 'Object',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'creation' }
Cards class >> create [ 

^self new intialize
]

{ #category : 'copying' }
Cards >> copy [
|acard|
	acard:=self class create.
	^acard.
	
]

{ #category : 'method' }
Cards >> effectAppliedTo: aShip [
	^0
]

{ #category : 'method' }
Cards >> ifAllyWith:aShip give: fuel [
]
