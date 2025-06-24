Class {
	#name : 'CancellationCard',
	#superclass : 'Object',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
CancellationCard >> applyeffectTo: aCardManager [
]

{ #category : 'as yet unclassified' }
CancellationCard >> applyeffectTo: aCardManager toDelete: anActiveTargetCard [ 
	aCardManager delete: anActiveTargetCard.
]
