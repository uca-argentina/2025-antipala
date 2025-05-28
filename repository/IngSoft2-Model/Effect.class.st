Class {
	#name : 'Effect',
	#superclass : 'Object',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'testing' }
Effect class >> effectProbability [

	^ 40 "subclassResponsibility"
]

{ #category : 'testing' }
Effect >> effectProbability [
	^ self class effectProbability
]

{ #category : 'testing' }
Effect >> isHyperGravity [
    ^ false
]
