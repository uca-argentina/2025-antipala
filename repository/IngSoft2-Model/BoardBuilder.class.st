Class {
	#name : 'BoardBuilder',
	#superclass : 'Object',
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
BoardBuilder >> initAtomicBomb:aCollectionshit position:post [
	

	^AtomicBomb at:post and:aCollectionshit 
]

{ #category : 'as yet unclassified' }
BoardBuilder >> randomBoard [
]
