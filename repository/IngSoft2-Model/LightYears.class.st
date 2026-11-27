Class {
	#name : 'LightYears',
	#superclass : 'Distance',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'initialization' }
LightYears >> inParsecs [

	^ amount / 3
]
