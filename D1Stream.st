Class new title: D1Stream
	subclassof: Object
	fields: ' hot cool hotStart hotEnd coolStart coolEnd'
	declare: '';
	classified: 'D1Recognizer'

D1Stream understands: 'atEnd
	[
	 (hot  nil and [coolStart = cool length]) or [nil  hot and [coolStart > cool length]]]' classified: 'As yet unclassified'


D1Stream understands: 'init: aVector
	[cool _ aVector.
	coolStart _ 2.
	coolEnd _ aVector length.
	hot _ cool  1]
' classified: 'As yet unclassified'


D1Stream understands: 'push: anObject
	[self shift.
	hot _ anObject]' classified: 'As yet unclassified'


D1Stream understands: 'current
	[[hot  nil  [ cool  (coolStart + 1)]].
	 cool  coolStart]' classified: 'As yet unclassified'


D1Stream understands: 'shift
	[[hot  nil  [coolStart _ coolStart + 1.  self]
	true  [hot _ nil]]]' classified: 'As yet unclassified'


D1Stream understands: 'prev
	[[hot  nil  [ cool  coolStart]].
	 hot]' classified: 'As yet unclassified'


